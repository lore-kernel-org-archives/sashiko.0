Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72BA4DE72B
	for <sashiko@lists.linux.dev>; Mon, 28 Sep 2026 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606324; cv=pass; b=uZSWuzGH1XIEjBxo7rhvU1DlzcMGIKYGIzS1cvkShFVKqoyLr7+7Qaz+rtgAIi58mMDb2Hj25zT9yF23JDbkdLGAokiOw7rRT2/eKoy9SPdeVzTWism5/clXc5exqohsod8/QvrvIAd2VKsMhuDGhaqOFcSw9QwUeNNkHUCXySA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606324; c=relaxed/simple;
	bh=YhYHEfQaAQQLmxQ06SBQeoF3ZRP1Rt+w4oJ57xL+jnU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HAesa+9YYFAc0ATe8SV7pXbOyHNiSDi79xF0pSHd9MDfQePfj2UWgrpFqJjKNHyX+s1THeeni36klQ5LB+WeA3lOV2zlQrGXQddnGcIt8AKjmwpNGnVPunYw0EzjBBGxPYCKd9OoWNUgbXAs5FF3TaHdB422oEHlkzqZDMg0hNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0G6Wg56; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0G6Wg56"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a65b23ad72so20745031fa.1
        for <sashiko@lists.linux.dev>; Mon, 28 Sep 2026 07:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790606317; cv=none;
        d=google.com; s=arc-20260327;
        b=La2FcbtSr9wE4TBdgrYBrQE+cz8y8J/SYQFz63rE0Rj4t6hIiPKcDsSbnpRloxfX4X
         2mmWQw36wBfp6GesTmySlxSnxnnwOwo6XAD+FCZt/EDYlEUDTvfw5/r4+tClaicQUgOP
         6FFg/n9d8uitevg4/6xjIBz1ugpqBZ7MuL5XcTRm4FvfP5hgNcWWATd+df/lIzKDLaxP
         5MxQ5Xz9ql/1gGbykmW/TLtahZCz8QBjFsVWLpAiXdA0BoC2DOSYkZVPsU4TBIT0GQzT
         lRx5RSyyQ/gbBuV0dZ7RQykiIlcYVvE9CvIPOUdeSKlmCG+1pzcmCWUe3I3YCIXiRA+Y
         lXcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YhYHEfQaAQQLmxQ06SBQeoF3ZRP1Rt+w4oJ57xL+jnU=;
        fh=HcGdhGcItcW9GSXstMW/vRjM1pLZ2hS7bNLN/OlwQ0k=;
        b=KFrvUVwEOwuinxiWQiKpRpLAdxQyQTMa6+hPagXnm54ISmbBWccKFpJnl7xQFH/MM/
         c424oZt6P7vv2ay1cArtYkm42xJFY7RaZvdh+RSkn+6HYpAZB8tvsyzP5tcHbGkZCbez
         KlhiQAISFzP6DjDdGajUsNFt7LTlKJFD4CBwWGif9QQYLEta2CzSK3ceFxsGkqnADToJ
         Hh1QHM4WguPy1tbvFx0aRLrsZejn2oAo2aFASn4EPsmEx3e6xwhmLvOBq25dSN2EUSNo
         EQx8boDshQ3bnsbxkIfUpDLqX1QtI1nWvrEdiorIQOrBuS/uls23u2eyN/fdqzhvfNGy
         0DYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790606317; x=1791211117; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YhYHEfQaAQQLmxQ06SBQeoF3ZRP1Rt+w4oJ57xL+jnU=;
        b=C0G6Wg56Dt8CcShWXx7NDRZFfOBr/TBr2NvLZIC/ZnDaMv8CTYKmtUNiikrCaN7aBd
         esRlVjShjIBYAIAXVuQoOLQruVoaYrKpbRL0jQjJ7ntpvc6f4q20UlEPulzka5v/wqq4
         6xat4rVJSPu+yagusOioq63ZNxV9U8mSnYjAioYDdWtFZEfzyyOBZykJtiT/UosZm5nt
         ssg7UVMYQuCx6ikFXXVKUX6r+P3KywBkPwyiA/xYywJ8OgK8b8EKadTIv0L8HbzX1xn+
         kB59ssuVjcyy8H3q8D8533qh4FTta8XHRlw08OE5WfTKuN+LERJCaT5D/fvKu0l2/NVo
         CxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606317; x=1791211117;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhYHEfQaAQQLmxQ06SBQeoF3ZRP1Rt+w4oJ57xL+jnU=;
        b=iN7WYuVgkeaQdDRp/2VLnRDCIPkm0+JEKIfUKjI6Ffo1+SWP07WCDG0NMDF1XNRWUK
         7aHFbZEXqeN249jrmcf+YYmGxdL7329t5WrWGwki0f2bXOYIQK/Xfhge9b6ZEygpZU5y
         2ksZ0i+SOwnjM6PA5e2jxahF/8GOjOW7GgRHE2XjjXpsU0OEzBeo2G1P0mATvkawcQsP
         muX7wXbO9i56rgeN+tAWABnU2ajX8rTcmBfHFW26UxVrF2DpUJVcMC6We2zPFkgVUGMJ
         AJhgLyRjWK3ZB3nMTWE0cYvA+vkwp5PH0zvpUnk/DmYuNZ/jV+i4pTudJEx7UKgK4qET
         87+A==
X-Gm-Message-State: AFq9FYLHX14TX6NDSyRhSwxcTwH3P3ptCtYg67fe5CGhi8U6EqVOuRFr
	iJzQrOwvoHn19mqHoRzZlu8ANDH2YjKzZOkGbsJ3dgtDky1StB1Nr5fRa+Bd83r1hS3Va4w0zn6
	ZzclPKfAx95mISy9JLhCmgEzvfyBmLT10xA==
X-Gm-Gg: AYBFou3WH3ItOI9SvmmIWvo5LdIbZXPvJCywktEnoH5L7mhhk5Yic2g2pUQKyAsOo4t
	fT7o7cy8G0oOvPgwL7d3KCPgtGionwmNX+uE+e5zVMOVImgH+JgIl3N4fhhRnQQJYJBvwnve50M
	ooeoQ/qoDQLpi/w55HHrAv7gXKg9qrhH7kVlCFzkEQoy0+anIS/6SjoucdO1J1mnY9htbthEu7g
	9rMw4O5ZMm9tY3aoa3qf432aZ8R0gFIqy8xum3KIqDOc9AKXrpbDhCKQ1eYWCSBxFaqTDh1oQPo
	5/gYNhFv3+ixFb3+17E9NTvO9SkBIFqusU5thudkuvJf/+NVmCtw2M/uuQ==
X-Received: by 2002:a2e:a591:0:b0:3a6:4a63:4d78 with SMTP id
 38308e7fff4ca-3a64a634dddmr27655721fa.11.1790606316893; Mon, 28 Sep 2026
 07:38:36 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 28 Sep 2026 07:38:36 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 28 Sep 2026 07:38:36 -0700
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Bartosz Chronowski <immersa.bartosz.chronowski@gmail.com>
Date: Mon, 28 Sep 2026 07:38:36 -0700
X-Gm-Features: AclHuK8yWalu-DGJHRW6QsV_GWqmA7v1f179IAigmh0Vgs0W5kkfbZSOD_PXtog
Message-ID: <CAFsnwTcgWvGNTVn8q5cco1qTLqsQwg0T=eg=C4M+wDirCxAKmA@mail.gmail.com>
Subject: Request for patch submission and CLI access to sashiko.dev
To: sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko Team,

I work on Linux kernel fixes and would like to submit individual patches
for review on sashiko.dev, including through sashiko-cli.

May I ask to enable sign-in for the email address I am sending this message
from and grant permissions to:
 - ingest, for submitting patches
 - review, if separately required to trigger or rerun reviews

Could you please also advise the supported authentication procedure for
remote sashiko-cli submissions?

I understand that patchsets and review results on the hosted instance are
public. Is there any supported private or unlisted submission option?

Best regards,
Bartosz
