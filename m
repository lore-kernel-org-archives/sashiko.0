Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F46838911B
	for <sashiko@lists.linux.dev>; Mon,  1 Jun 2026 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307225; cv=none; b=DfYceVm9F8EgguPk2uZuMLMJe8oy0hOaOWywzPq/8rknz/wR7vb/fRa3WiRiswZsH02hMYjEx/173/6KUUP/jHU40cZbWBanTfdlwudsdhD9KfaYYpMr80kvaMRb9aUFJhp9rwCAUh8Koh6TZE3H9ZFdywzL3k7Rom2lapW8/H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307225; c=relaxed/simple;
	bh=aX74j8ChuB4X7aK8cdIeTjS0A7TtXudRVrW23+xDyiA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=duiM6bjnEe5v4KVhEYB2Lhmyjp6YoUrhUWWp5+xL7EQqLqKlz7TbpeBXhX2OMe1Ja3Yr1hIFZT0i4CcTs29ix5W0xTouwvlYPEJ6vlZBMLi98uqpzfZWYnIJirJbz6Mp/58wUAbTm2GqorDrGq6TwDDMKm/0+BCTlpdNXdeiUnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJMe0Fzh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJMe0Fzh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1496C1F00898;
	Mon,  1 Jun 2026 09:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780307216;
	bh=REOqV+aEVVxrGGEgaZlorZnu3WMU27BTgwFTAmtW/2g=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=nJMe0Fzhoz67cxcSTAhWaodkldwrOjD95bzfCUTsLo0EiZ0somDi82mHecXXOcfIF
	 qvGkOwgp9T8ZcYFRp/hENTpcVtNcjY7J04yZfvAtePTki/KsJPnlU4xUJgKy6yrFK3
	 H3b8Oaoox+PCwGfHbbZCH1LtB8c3rPqlQZanc0hvwYYjeZxBaAkh5p8fEfYGsHt6RY
	 hbfXV/nVx9w231ogxGRc9ztXcKVqSbkNcO2JGuLRDFLVPv2I5wYyhRmoXd0uYfvh5Q
	 Cys7Gl8OBFAeWla6dZXvuK5BM7n/hvsFohb9xOYlf/9GgcOCvoCcTSsye+cQAuQDKq
	 y+4ovLYeE6Pew==
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 11:46:54 +0200
Message-Id: <DIXM8JL1CM5A.315I0YBSDJT5O@kernel.org>
Subject: Re: Sashiko email policy precedence
Cc: "Roman Gushchin" <roman.gushchin@linux.dev>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <sashiko@lists.linux.dev>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <DIX8UX2TJP8E.4OAWKUUF5JG1@kernel.org>
 <CANiq72mSpur28Fz8YL7_-FJk_h008kt=sw6mLeSsRNmiy+ko1Q@mail.gmail.com>
In-Reply-To: <CANiq72mSpur28Fz8YL7_-FJk_h008kt=sw6mLeSsRNmiy+ko1Q@mail.gmail.com>

On Mon Jun 1, 2026 at 8:16 AM CEST, Miguel Ojeda wrote:
> On Mon, Jun 1, 2026 at 1:17=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
> IIUC, from what Danilo says, the current algorithm's conservative approac=
h
> would remove that setting as soon as the patch is sent to any list where =
that
> isn't the case, right?

Only if the other list has a sashiko email policy entry in the first place,
otherwise it is not part of the matching loop and no further logic is appli=
ed.

I'd assume that this is intentional, and can be read as "no entry, no expre=
ssed
preference".

> if it is too complex to implement other logic, I guess it is an option.

Flagging something as wide list seems rather simple [1], the tristate [2] w=
ould
work as well, but seems a bit more complicated and potentially requires
adjusting the existing policies.

(Test adjustments stripped from [2]; code is LLM generated.)

[1]

diff --git a/src/email_policy.rs b/src/email_policy.rs
index 9fe1179330f3..1ae892e67535 100644
--- a/src/email_policy.rs
+++ b/src/email_policy.rs
@@ -43,6 +43,10 @@ pub struct SubsystemPolicy {
     pub embargo_hours: Option<u32>,
     #[serde(default)]
     pub send_positive_review: bool,
+    /// When true and co-matched with a non-wide list, only `cc` is
+    /// contributed. All boolean flags are deferred to the non-wide lists.
+    #[serde(default)]
+    pub wide_list: bool,
 }

 impl EmailPolicyConfig {
diff --git a/src/email_router.rs b/src/email_router.rs
index c17273aad8ff..216a85d7738d 100644
--- a/src/email_router.rs
+++ b/src/email_router.rs
@@ -93,7 +93,18 @@ impl EmailRouter {
         let mut send_positive_review =3D false;
         let mut cc =3D Vec::new();

-        for p in active_policies {
+        let has_non_wide =3D active_policies.iter().any(|p| !p.wide_list);
+
+        for p in &active_policies {
+            let deferred =3D p.wide_list && has_non_wide;
+
+            if deferred {
+                for cr in &p.cc {
+                    cc.push(cr.clone());
+                }
+                continue;
+            }
+
             if p.mute_all {
                 mute_all =3D true;
             }

[2]

diff --git a/src/email_policy.rs b/src/email_policy.rs
index 9fe1179330f3..5c9d94a4d416 100644
--- a/src/email_policy.rs
+++ b/src/email_policy.rs
@@ -23,14 +23,15 @@ pub struct EmailPolicyConfig {
 pub struct SubsystemPolicy {
     #[serde(default)]
     pub lists: Vec<String>,
+    /// None =3D no preference, Some(false) =3D private, Some(true) =3D pu=
blic.
     #[serde(default)]
-    pub reply_all: bool,
+    pub reply_all: Option<bool>,
     #[serde(default)]
-    pub reply_to_author: bool,
+    pub reply_to_author: Option<bool>,
     #[serde(default)]
-    pub cc_individuals: bool,
+    pub cc_individuals: Option<bool>,
     #[serde(default)]
-    pub mute_all: bool,
+    pub mute_all: Option<bool>,
     #[serde(default)]
     pub cc: Vec<String>,
     #[serde(default)]
@@ -42,7 +43,7 @@ pub struct SubsystemPolicy {
     #[serde(default)]
     pub embargo_hours: Option<u32>,
     #[serde(default)]
-    pub send_positive_review: bool,
+    pub send_positive_review: Option<bool>,
 }
=20
 impl EmailPolicyConfig {
diff --git a/src/email_router.rs b/src/email_router.rs
index c17273aad8ff..452c09411552 100644
--- a/src/email_router.rs
+++ b/src/email_router.rs
@@ -12,6 +12,19 @@ pub enum Action {
=20
 pub struct EmailRouter {}
=20
+/// Merges two Option<bool> policy votes. `dominant` is the value that win=
s on
+/// conflict: `true` for mute_all, reply_to_author, cc_individuals, and
+/// send_positive_review (any-true wins); `false` for reply_all (any-false=
 wins).
+fn merge_flag(acc: Option<bool>, vote: Option<bool>, dominant: bool) -> Op=
tion<bool> {
+    match (acc, vote) {
+        (_, None) =3D> acc,
+        (None, _) =3D> vote,
+        (Some(v), _) if v =3D=3D dominant =3D> acc,
+        (_, Some(v)) if v =3D=3D dominant =3D> vote,
+        _ =3D> acc,
+    }
+}
+
 impl EmailRouter {
     pub fn resolve_patchwork(
         policy: &EmailPolicyConfig,
@@ -86,34 +99,30 @@ impl EmailRouter {
             active_policies.push(&policy.defaults);
         }
=20
-        let mut mute_all =3D false;
-        let mut is_private =3D false;
-        let mut reply_to_author =3D false;
-        let mut cc_individuals =3D false;
-        let mut send_positive_review =3D false;
+        let mut mute_all =3D None;
+        let mut reply_all =3D None;
+        let mut reply_to_author =3D None;
+        let mut cc_individuals =3D None;
+        let mut send_positive_review =3D None;
         let mut cc =3D Vec::new();
=20
         for p in active_policies {
-            if p.mute_all {
-                mute_all =3D true;
-            }
-            if !p.reply_all {
-                is_private =3D true;
-            }
-            if p.reply_to_author {
-                reply_to_author =3D true;
-            }
-            if p.cc_individuals {
-                cc_individuals =3D true;
-            }
-            if p.send_positive_review {
-                send_positive_review =3D true;
-            }
+            mute_all =3D merge_flag(mute_all, p.mute_all, true);
+            reply_all =3D merge_flag(reply_all, p.reply_all, false);
+            reply_to_author =3D merge_flag(reply_to_author, p.reply_to_aut=
hor, true);
+            cc_individuals =3D merge_flag(cc_individuals, p.cc_individuals=
, true);
+            send_positive_review =3D merge_flag(send_positive_review, p.se=
nd_positive_review, true);
             for cr in &p.cc {
                 cc.push(cr.clone());
             }
         }
=20
+        let mute_all =3D mute_all.unwrap_or(false);
+        let is_private =3D !reply_all.unwrap_or(false);
+        let reply_to_author =3D reply_to_author.unwrap_or(false);
+        let cc_individuals =3D cc_individuals.unwrap_or(false);
+        let send_positive_review =3D send_positive_review.unwrap_or(false)=
;
+
         // Always append defaults.cc so users can define a global CC
         for cr in &policy.defaults.cc {
             cc.push(cr.clone());
