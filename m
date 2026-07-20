Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA002823DD
	for <sashiko@lists.linux.dev>; Mon, 20 Jul 2026 04:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784521198; cv=none; b=gl6vzetx/DBjTGmMAwdStdSY8zFjAv2rDTfNMsttONfsoP855NorrgHMavItC2aYMZpZol/aX9wrxhDCQBo8XhZkqD63iKmwb9gpxPo517WQdJxn1m6Lv2X8d36JODv7q2Feyrvn8WJkSv9/B1UNapC8HrIoWox56m/wdDhECp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784521198; c=relaxed/simple;
	bh=1xiT1/rVUVwV0zbhhUJNmGXfWov5CB/mKQ06bjtemNQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=mocyRDE02ktrmNYlUKKR+Le5tmAwDCNWRiYQmFjFBLaQml+q/9j13UAAhLIebXoZW+uJcEkbvXbcHN+7egdzSSJqKxE6nogf0azJTkS1nDYW/GN2/dnZ7sZQ5MBphTQzU8VXCtu64uy+fLytEA7g8NoaxoI43j95TgaRWMO4ZGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 66K4JnLl077823
	for <sashiko@lists.linux.dev>; Mon, 20 Jul 2026 13:19:49 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 66K4JnDo077820
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <sashiko@lists.linux.dev>; Mon, 20 Jul 2026 13:19:49 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <0135b46f-036b-4834-ac17-4d4a469319d4@I-love.SAKURA.ne.jp>
Date: Mon, 20 Jul 2026 13:19:49 +0900
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: sashiko@lists.linux.dev
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] nntp: use trim_end_matches() to remove only \r and \n
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav405.rs.sakura.ne.jp

Since trim_end() eliminates all trailing white space characters, a patch
gets corrupted when there is a line with trailing white space characters.

Closes: #320

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 src/nntp.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/nntp.rs b/src/nntp.rs
index a3315cd..9c3b20f 100644
--- a/src/nntp.rs
+++ b/src/nntp.rs
@@ -107,7 +107,7 @@ impl NntpClient {
             }
 
             let line_raw = String::from_utf8_lossy(&buf);
-            let line = line_raw.trim_end(); // remove \r\n
+            let line = line_raw.trim_end_matches(['\r', '\n']);
 
             if line == "." {
                 break;
@@ -164,7 +164,7 @@ impl NntpClient {
 
             // Convert to string (lossy)
             let line_raw = String::from_utf8_lossy(&buf);
-            let line = line_raw.trim_end(); // remove \r\n
+            let line = line_raw.trim_end_matches(['\r', '\n']);
 
             if line == "." {
                 break;
-- 
2.55.0
