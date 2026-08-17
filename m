Received: from mta1.migadu.com (out-48.mta1.migadu.com [95.215.58.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7EA361965
	for <sashiko@lists.linux.dev>; Mon, 17 Aug 2026 20:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997366; cv=none; b=gd1zkOVGQFu2/jBn+XYw6t+qfRbNijg9VGVM67dVDBue7h4jJX7G8aG0hbuFBnZSDAU66C6gjIj9pNr6ns+GNDo+MT+eNHeBWSnK4Dpp6HCwg/Py5aPVP5hTPNCYJlOO+Qv72t+k9QzOIFhNGKFK//PPDSeH2qiZglurqsgxNco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997366; c=relaxed/simple;
	bh=rrBKLG/s/l884HkYMYJLHATuaqpqeCk06T6it8bvIaw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tvBcgcDVGL9zFejhk02ZSV9s2tPyWwFafa3VxjZ9WrV2/4g5czFVciX+u/ROhBQ/4SBAW9eIhSKop/xcDAsn54BhY9Io5cjltg7El3kTbu4+ZJnYTO8JoA6Hx0AiZFEbZNIPApIM7QySZZ1vKyl2hobY0q5RZ/F+RGp7hWVZsz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lN5ptTOp; arc=none smtp.client-ip=95.215.58.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lN5ptTOp"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=rrBKLG/s/l884HkYMYJLHATuaqpqeCk06T6it8bvIaw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786997358; v=1; x=1787602158;
 b=lN5ptTOpjJ8qYrnQjxUBBZ9Xt0KCFlN3xwtBgizx5hqX4P45hJ6n5VRllvNifCNaH/4TVLvv
 5AisJXKuJAK/kHzM/3IVHfx8jVjJgRFc0xPPDXSHnfnA96vM+tqV7+wov9wday5HK/WRPIV/7dQ
 u59H0TScNrV1m+SDie1BVjgE=
X-Envelope-To: sashiko@lists.linux.dev
Received: from castle.c.googlers.com (35.227.148.244)
	by mta11.migadu.com with ESMTPS id c57d1a71b87502da;
	Mon, 17 Aug 2026 20:09:08 +0000
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: sashiko@lists.linux.dev,  Mark Fasheh <mark@fasheh.com>,  Joel Becker
 <jlbec@evilplan.org>
Subject: Re: [PATCH 2/2] email: add policy for the ocfs2 subsystem
In-Reply-To: <20260806073654.2510985-2-joseph.qi@linux.alibaba.com> (Joseph
	Qi's message of "Thu, 6 Aug 2026 15:36:54 +0800")
References: <20260806073654.2510985-1-joseph.qi@linux.alibaba.com>
	<20260806073654.2510985-2-joseph.qi@linux.alibaba.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 17 Aug 2026 20:09:05 +0000
Message-ID: <7ia4ik58fr1a.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Joseph Qi <joseph.qi@linux.alibaba.com> writes:

> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
>  sashiko.dev/email_policy.toml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/sashiko.dev/email_policy.toml b/sashiko.dev/email_policy.toml
> index 26a6665..0570d35 100644
> --- a/sashiko.dev/email_policy.toml
> +++ b/sashiko.dev/email_policy.toml
> @@ -276,3 +276,11 @@ cc = ["Miquel Raynal <miquel.raynal@bootlin.com>",
>        "Pratyush Yadav <pratyush@kernel.org>",
>        "Michael Walle <mwalle@kernel.org>",
>        "Takahiro Kuwano <takahiro.kuwano@infineon.com>"]
> +
> +[subsystems.ocfs2]
> +lists = ["ocfs2-devel@lists.linux.dev"]
> +reply_to_author = true
> +send_positive_review = true
> +cc = ["Mark Fasheh <mark@fasheh.com>",
> +      "Joel Becker <jlbec@evilplan.org>",
> +      "Joseph Qi <joseph.qi@linux.alibaba.com>"]

Applied, thanks.

