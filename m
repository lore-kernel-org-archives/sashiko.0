Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC272882B4
	for <sashiko@lists.linux.dev>; Sun, 19 Apr 2026 14:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776609572; cv=none; b=qiWxr9MGQs+afXugOCP1TB6XZG+KH80hCkvoXfmvekRRHNc7qhdyw7IZBsZwwhwRblQd36L83/4CCd1IEEvStzsKjLTPM67d2PrMPyp3FtuYn/8wWSdlEycMCd0e5L1Dwo4JTJyCdFQSE/gj6UlN39q+czOH0kXyPYsUoN7P5wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776609572; c=relaxed/simple;
	bh=jzaoJZpPImzpyoHBWrmHBx0zwQTTu+hYnz8vIDuZbY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fqs7nxdxW9dywHwG4EbU0SJz3NCBvy6XDrjPgxCCCdBBpKrQAuGlHCek1OTMqleGzYFF1oKoKSAJD0G1ZWgHhpoeJddN5/WgGt9o9UTXWf0n8ob29QkJeRdqaoHQ5r+TgikMdCrlL9sLM3ufb83iIGFvzw1GBPTXRIu/z9+ywo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpR6C0E+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpR6C0E+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AD3C2BCAF;
	Sun, 19 Apr 2026 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776609572;
	bh=jzaoJZpPImzpyoHBWrmHBx0zwQTTu+hYnz8vIDuZbY8=;
	h=Date:From:To:Cc:Subject:From;
	b=cpR6C0E+MYHq5w3CLVIgonYTzEdF8XkhwVXpXscV1L78YrGynqkYWDFIrhN/Exwx0
	 XXRKRA1r3v/DjrQzMI005VfeLSCZPyyeGeCqRImwhnn7szCTn8x62nh4gZBSLa6F+g
	 Xa3ZOilTi0CL+IpBvDxEgtgrKn3Yi0PqQfKKEZZcAVWaeM3jOW4s1MQBshFgzcxoPG
	 8e+tlzZ0wJXaBfiHDOPi+PzSrqFInOHqV3bdvJDVyoOnt53SQgZHGLqtWy2Fxq4zEq
	 7p6MIoxzY8GH0yYDGi46+UI94+oNRfN8ZnnECVojoCD4kd+5IAngP94C9hciJbsJvL
	 ZhEI78AlbhkAQ==
Date: Sun, 19 Apr 2026 11:39:28 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev, Derek Barbosa <debarbos@redhat.com>,
	Clark Williams <williams@redhat.com>
Subject: [PATCH 1/1] cli: Add cancel command to abort pending reviews
Message-ID: <aeTpIFdgGhuyYgcZ@x1>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

	I still need to setup a github repo, see if this is acceptable,
first patch, ran clippy, rust-fmt, tests passed, works for me :-)

- Arnaldo

---

Add `sashiko-cli cancel <id>` to cancel patchsets in Pending or
Incomplete state. With `--force`, also cancels patchsets already
In Review. The reviewer now checks for Cancelled status before
writing its final result, preventing a force-cancelled review
from being overwritten.

Co-Authored-By: Claude Opus 4.6 (1M context) <noreply@anthropic.com>
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 src/api.rs             | 46 ++++++++++++++++++++++++++++++++++++++
 src/bin/sashiko-cli.rs | 50 ++++++++++++++++++++++++++++++++++++++++++
 src/db.rs              | 25 +++++++++++++++++++++
 src/reviewer.rs        | 24 +++++++++++++-------
 4 files changed, 137 insertions(+), 8 deletions(-)

diff --git a/src/api.rs b/src/api.rs
index 2c132b7cd0e6a469..d43f225c37fe1e6e 100644
--- a/src/api.rs
+++ b/src/api.rs
@@ -186,6 +186,13 @@ pub struct SubsystemQuery {
     pub subsystem_id: Option<i64>,
 }
 
+#[derive(Deserialize)]
+pub struct CancelQuery {
+    pub id: i64,
+    #[serde(default)]
+    pub force: bool,
+}
+
 #[derive(Deserialize)]
 pub struct InjectRequest {
     pub raw: String,
@@ -267,6 +274,7 @@ pub async fn run_server(
         .route("/api/stats/tools", get(stats_tools))
         .route("/api/submit", post(submit_patch))
         .route("/api/patchset/rerun", post(rerun_patchset))
+        .route("/api/patchset/cancel", post(cancel_patchset))
         .route("/api/patch/rerun", post(rerun_patch))
         .route("/", get_service(ServeFile::new("static/index.html")))
         .nest_service("/static", ServeDir::new("static"))
@@ -931,6 +939,44 @@ async fn rerun_patchset(
     Ok(Json(serde_json::json!({ "status": "accepted" })))
 }
 
+async fn cancel_patchset(
+    ConnectInfo(addr): ConnectInfo<SocketAddr>,
+    State(state): State<Arc<AppState>>,
+    Query(query): Query<CancelQuery>,
+) -> Result<Json<serde_json::Value>, StatusCode> {
+    if state.read_only {
+        return Err(StatusCode::FORBIDDEN);
+    }
+
+    if !state.allow_all_submit && !addr.ip().is_loopback() {
+        return Err(StatusCode::FORBIDDEN);
+    }
+
+    let cancelled = state
+        .db
+        .cancel_patchset(query.id, query.force)
+        .await
+        .map_err(|e| {
+            error!("Failed to cancel patchset {}: {}", query.id, e);
+            StatusCode::INTERNAL_SERVER_ERROR
+        })?;
+
+    if cancelled {
+        info!("Patchset {} cancelled (force={})", query.id, query.force);
+        Ok(Json(serde_json::json!({ "status": "cancelled" })))
+    } else {
+        let reason = if query.force {
+            "Patchset is not in a cancellable state (must be Pending, Incomplete, or In Review)"
+        } else {
+            "Patchset is not in a cancellable state (must be Pending or Incomplete; use force=true for In Review)"
+        };
+        Ok(Json(serde_json::json!({
+            "status": "not_modified",
+            "reason": reason
+        })))
+    }
+}
+
 async fn rerun_patch(
     ConnectInfo(addr): ConnectInfo<SocketAddr>,
     State(state): State<Arc<AppState>>,
diff --git a/src/bin/sashiko-cli.rs b/src/bin/sashiko-cli.rs
index 09a2ce63fad44376..4a60dc51df0f8567 100644
--- a/src/bin/sashiko-cli.rs
+++ b/src/bin/sashiko-cli.rs
@@ -97,6 +97,15 @@ enum Commands {
         #[arg(default_value = "latest")]
         id: String,
     },
+    /// Cancel a pending review
+    Cancel {
+        /// ID of the patchset to cancel
+        id: i64,
+
+        /// Force cancel even if the review is already in progress
+        #[arg(long, short)]
+        force: bool,
+    },
 }
 
 #[derive(Copy, Clone, PartialEq, Eq, PartialOrd, Ord, ValueEnum)]
@@ -182,6 +191,7 @@ async fn run_command(
             per_page,
         } => handle_list(client, base_url, page, per_page, filter, format).await,
         Commands::Show { id } => handle_show(client, base_url, id, format).await,
+        Commands::Cancel { id, force } => handle_cancel(client, base_url, id, force, format).await,
     }
 }
 
@@ -389,6 +399,7 @@ async fn handle_list(
                         "Embargoed" => Color::Magenta,
                         "Failed" | "Error" | "Failed To Apply" => Color::Red,
                         "Pending" | "In Review" => Color::Yellow,
+                        "Cancelled" => Color::Red,
                         _ => Color::White,
                     };
 
@@ -672,6 +683,45 @@ async fn handle_show(
     Ok(())
 }
 
+async fn handle_cancel(
+    client: &Client,
+    base_url: &str,
+    id: i64,
+    force: bool,
+    format: OutputFormat,
+) -> Result<()> {
+    let url = format!("{}/api/patchset/cancel?id={}&force={}", base_url, id, force);
+    let resp = client.post(&url).send().await?;
+
+    if resp.status().is_success() {
+        let result: serde_json::Value = resp.json().await?;
+        match format {
+            OutputFormat::Json => println!("{}", serde_json::to_string_pretty(&result)?),
+            OutputFormat::Text => {
+                let status = result["status"].as_str().unwrap_or("");
+                if status == "cancelled" {
+                    print_colored(Color::Green, "Cancelled: ");
+                    println!("Patchset {} has been cancelled.", id);
+                } else {
+                    print_colored(Color::Yellow, "Not modified: ");
+                    println!(
+                        "{}",
+                        result["reason"]
+                            .as_str()
+                            .unwrap_or("Patchset could not be cancelled.")
+                    );
+                }
+            }
+        }
+    } else {
+        let status = resp.status();
+        let text = resp.text().await.unwrap_or_default();
+        return Err(anyhow::anyhow!("Cancel failed ({}): {}", status, text));
+    }
+
+    Ok(())
+}
+
 fn print_colored(color: Color, text: &str) {
     let mut stdout = StandardStream::stdout(ColorChoice::Auto);
     stdout
diff --git a/src/db.rs b/src/db.rs
index 60af07cbbb9c5278..178d6c154e4e77d9 100644
--- a/src/db.rs
+++ b/src/db.rs
@@ -3205,6 +3205,31 @@ impl Database {
         Ok(())
     }
 
+    pub async fn get_patchset_status(&self, id: i64) -> Result<Option<String>> {
+        let mut rows = self
+            .conn
+            .query(
+                "SELECT status FROM patchsets WHERE id = ?",
+                libsql::params![id],
+            )
+            .await?;
+        if let Some(row) = rows.next().await? {
+            Ok(Some(row.get(0)?))
+        } else {
+            Ok(None)
+        }
+    }
+
+    pub async fn cancel_patchset(&self, id: i64, force: bool) -> Result<bool> {
+        let query = if force {
+            "UPDATE patchsets SET status = 'Cancelled' WHERE id = ? AND status IN ('Pending', 'Incomplete', 'In Review')"
+        } else {
+            "UPDATE patchsets SET status = 'Cancelled' WHERE id = ? AND status IN ('Pending', 'Incomplete')"
+        };
+        let count = self.conn.execute(query, libsql::params![id]).await?;
+        Ok(count > 0)
+    }
+
     pub async fn restart_failed_reviews(&self) -> Result<u64> {
         let count = self.conn.execute(
             "UPDATE patchsets SET status = 'Pending', failed_reason = NULL WHERE status = 'Failed'",
diff --git a/src/reviewer.rs b/src/reviewer.rs
index d99f23fe93a35731..9007dc289bc86925 100644
--- a/src/reviewer.rs
+++ b/src/reviewer.rs
@@ -644,16 +644,24 @@ impl Reviewer {
             // Cleanup worktree here since we kept it alive for reuse
             let _ = worktree.remove().await;
 
-            let final_status = if review_success {
-                ReviewStatus::Reviewed.as_str().to_string()
+            let current_status = ctx.db.get_patchset_status(patchset_id).await.ok().flatten();
+            if current_status.as_deref() == Some(ReviewStatus::Cancelled.as_str()) {
+                info!(
+                    "Patchset {} was cancelled during review, preserving status",
+                    patchset_id
+                );
             } else {
-                ReviewStatus::Failed.as_str().to_string()
-            };
+                let final_status = if review_success {
+                    ReviewStatus::Reviewed.as_str().to_string()
+                } else {
+                    ReviewStatus::Failed.as_str().to_string()
+                };
 
-            let _ = ctx
-                .db
-                .update_patchset_status(patchset_id, &final_status)
-                .await;
+                let _ = ctx
+                    .db
+                    .update_patchset_status(patchset_id, &final_status)
+                    .await;
+            }
         } else {
             // No baseline found
             warn!("No working baseline found for patchset {}", patchset_id);
-- 
2.53.0

