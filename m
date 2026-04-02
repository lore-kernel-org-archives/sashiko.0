Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A963563DD
	for <sashiko@lists.linux.dev>; Thu,  2 Apr 2026 03:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775101208; cv=pass; b=RybEZGVEFAv04iWFL/YXBShnMK0d7X+misFiQlI3hdDB5nT9NFR3yQc7ZVkLIBKIYDDNcmUkBSyBWe4Ggqo29tQozzxdF9lRzLWH35eDgJIm6DbblmRcqeWvURWtSjgG4Ow+uiqXtBmreaaLQhXw4i3J5FH2jBgEZIRTdqmHOiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775101208; c=relaxed/simple;
	bh=9GMxaW9ED2E9tBgtbnDZRLIi0Ve+uDtN/uN25v9SuxU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=uXtYSNjJATgUi0uJ3yBovN2U8y6Hg00kyoEed8Fy3Yw6h793RItmuSXRGfZ198Lac0rb6fR1mA3IBsLvmqqbqiEIpkEsmXu1/ZE0iomsz4InxppVs03V4R9HJULOySvHes/WU+sQBJKFCBYowtfe21xXrOfJCMFeIHAFUZngKxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWz7pjf9; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWz7pjf9"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82ce0a9b41aso163899b3a.0
        for <sashiko@lists.linux.dev>; Wed, 01 Apr 2026 20:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775101206; cv=none;
        d=google.com; s=arc-20240605;
        b=J0VgMHd2FEPYsoM0dv3bOPSV0CT44m+ASjeMe1/oKYsVbMSkxBE8dJnD7YW0LTQAbU
         aOgSO5YsBql+bcaAKx+VPM5qNkwhUvvw+5tk+iwsTkklYGirWPMxLGDw2ZJn0fkrFReu
         PYeLEwrUm+hvZKwJ3WuhVp0fllqJVk8Ytp0gU00MMH6AAFFGneSIsys3FpCS3uKPFyH+
         fqaoOsZSSy55pwUBCgLuwaeha1Wlm3obOjikf2VJxCE9ny/RzwoDlDJIj8LSMjVmkxWr
         +SKrioti73mqPmn2WqeHAls8jcf4evxTbxnNs1HFHGWgGwOhyk8DLChrMj7YaRV4O2wZ
         GeOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9GMxaW9ED2E9tBgtbnDZRLIi0Ve+uDtN/uN25v9SuxU=;
        fh=HcGdhGcItcW9GSXstMW/vRjM1pLZ2hS7bNLN/OlwQ0k=;
        b=eFeuaoNF88yb0c1Asvu9tz3SJ5hgTmNEkROGjnbPdBDdwgI6G2/VviVsea1DEyXlYz
         9q6gHsuw06tUC+TGmBLX4zdsXpMRE602Bwq3yprNmEayxOoY32/irEGYimIWnw8CcJf8
         kJbmcSJDM6j+b7QUFoTwLfHNC0L1+N++f9Fm/7t4mK3qs2nsqJGszormP15FYNhiQmhq
         i06Tl3jOnzOturoXo3FXPhenpP0eVMdxDbFlDDturkECuo43kfiFY4ftRDmQyk2ZK+I4
         XYwFxH0n4U72vlgnndaPtoo6qwRWXRZrptNLXwfTnLrUC8Suc1C2eissjNSN/ASaDSJI
         4iDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775101206; x=1775706006; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9GMxaW9ED2E9tBgtbnDZRLIi0Ve+uDtN/uN25v9SuxU=;
        b=VWz7pjf9N8ePpkPTxjUIRhjok2auJc9H7tMSJuVtbsht+E95RzK7k7XpPlAchb2s+y
         OMiccIuQYAHvq0RpUSdq9NNEtdyKBZamz+T60XtfDXBFPacmFaUN9mHbmp7MNWsPLtAw
         6ocxkQHU0xYwcBX+0j8XaQZLcWTopcdS2LHD8awFCjdjtzMGxogZXAoUFqciOrp7uV42
         +By7QR2dixH+aVw6Hl3Q7zXvZHKT6N4K70C5eYm8H82ilZyMta9XJem0W28CFnsCdTZM
         HhGiLk3dvHEbKJbwhqO4u6xIpfKOTXaqml1dmUjgSWsN+BS3ZMUaerkiL26gxcRkkwNM
         Xj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775101206; x=1775706006;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9GMxaW9ED2E9tBgtbnDZRLIi0Ve+uDtN/uN25v9SuxU=;
        b=hzEAm5UCP2/NJKwv8DsUwhLRx48EoE+49d1Oqzr6bF0+h/4aQ4TVZ2WV5pFy8j7A0O
         TIw4TF+AQMnB0qdtX1rV0qqQpQmDLC+0TQZayt1letJqekF7en9uHDjNL7jpLn3hl9Qw
         Pwa7NN2GUwpX3dOMiYlKFd2y3bwHw8mDJ4/VmoyN7ygxkl+HCs6JsBLKJUu9cPCwr++K
         tJzQU9JNsEXpNGVN3wflVj/uedKj8yElVI4YLWrwx/yiKkEpXRI0vmBC05iLS4y1mp1K
         qxyOU4BCt7/euOe6qAhtjnJwPLizPNNna8Go22peg5MZF9EAP3NzxjqlyRUixdAmfjtK
         bRfg==
X-Gm-Message-State: AOJu0Yz5JM/03X87OUTDJtfMqL6D3WWH9pcvZqv0DurfmhMSM8rF7YIK
	rtLTcSUNlI1aCQ1BbXZbvhJWaXWfFTy2RIADfBxShxGYZZOW0Qq9Hp2/rAoOVYFqyUywsuUjkKQ
	RVbCDnXVM/DHCfTW+slBOp5lfUCH6r7BT5g8aVCY=
X-Gm-Gg: ATEYQzxLUq8KINV23EPWa5Ap2r/qstxKE1ZpUUKu10Z24S+6gdw60jg81s7ZYWqoArD
	FteEIPZMQBSBxtQd2OCpY7Ft229ZH/mafuatQNVVQpHG2hpb10Le3SS2oIrXSO3WGhgEPyUC5LF
	Oo//GNrQ2/VcdkXbMypvHphUV+X170sXZ2PH37RUNdd8IMgo3l4WspTY5p7pP9op6RYTJ3pUGHu
	jVDVD1DpnMjIZq5f3ngUDrEdaKV1lAatE6WGksSgzqAXF1pwSvthP6in/b5CPkGWh+smdS6hVFi
	PF96En5X2VLPjvTmieugC9pUzaX0XnrrY5SkETI2fKym8CdOSqszMmVXx4f3uom9KQo72RXLiNZ
	YO0Bcpg==
X-Received: by 2002:a05:6a00:1ac9:b0:82a:5d55:5807 with SMTP id
 d2e1a72fcca58-82ce88c385dmr6073291b3a.6.1775101206045; Wed, 01 Apr 2026
 20:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
Date: Wed, 1 Apr 2026 23:39:53 -0400
X-Gm-Features: AQROBzBMDxbOksMRk9dBz6ytZ2rbCLprLhQqb563YifZoQy1SnzpLT0IPTRL454
Message-ID: <CADvbK_cmh_9rRnbADVm04JWVtjEoQVReR1m1ZP7djPwQxA=feg@mail.gmail.com>
Subject: [QUESTION] how to submit multiple reviews on the same patchset
To: sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

After running the server locally by `cargo run`, I submitted a review by:

`cargo run --bin sashiko-cli -- submit HEAD~15..HEAD`

I could see one item on the list of the webpage in review.

While it was in review, I wanted to submit a new review on the same
patches by the same command:

`cargo run --bin sashiko-cli -- submit HEAD~15..HEAD`

However, after doing that, I didn't see a second item on the list of
the webpage, and it seemed the server just ignored the submission.

So is there any way that I can submit multiple reviews on the same
patchset? with something like ID or subject?

Thanks.
