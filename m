Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02740330B15
	for <sashiko@lists.linux.dev>; Mon, 20 Apr 2026 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699553; cv=none; b=nhy0pMJhUFE/mW7V00coEXwmAdeezOanrONDxp+EkbFmeejbxUSiw49AXe8bfg79XpAjJ2SAISJo0esLgOTV/eCJqTex5Cuky2/gPU86XLaNTSR6WYQuNW2yM82mAf9AF1892o7ZLF8KeG4EMUfHEltnaokzbooJc2pQ7CWi09M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699553; c=relaxed/simple;
	bh=CwSTe/qpL7qzlOFyJ/vTT7KDpK5GmaxHom12OT3uCF0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=WMKi60dthMvWzgXfr1ABLYq0oujJpNTpitdFa1+TWDrnWRecyHm3wacJH5IYjdAeMhDrZsYcs610lf+5pIs36ISVCCv2N5cLKHWiEZoiqq44Nb/W9/jMdWG3M2IBqtRjMjak6zyJwmBED/cbKis10uu2LB9Nc/6QQfKd0fHJ7xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjGDks7t; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjGDks7t"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40ede943bf0so1801558fac.2
        for <sashiko@lists.linux.dev>; Mon, 20 Apr 2026 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776699551; x=1777304351; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoFFQuLpG5Mt/AIKiw49NZtReeh7XqzcSdVHqZoLYZY=;
        b=EjGDks7tFzBYkKm1/oB2LHZcWuxVQLS7Hr5jlL4iD7pZnyiFLntxL2BxZrMyZ9yxjy
         M3a3KTcZvH638hnvJG5fZDWoB6pVecPiHmRvij72AwrsJ7w+bCt3JEwCbZp4OMcU7FjA
         uqSAVgpnk4nlLwQXtBjRM1KwiZEwWZuOOaQM8lO3Yo7pnf+LLedl+Gfq9JTuYZfBdo6+
         zG7oooWN/7SflULoDTS9ydZ6aeD2SSQHvc95zmxsYYaKqkZaqmHK1MjjmQYAq+eYc/kx
         yD3BHYywueKRFlL+F+H2js0N5YgxxgzwMGde78IJoYiI/DTWEx+uLRwmd/I1Qid8oxsg
         qNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699551; x=1777304351;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NoFFQuLpG5Mt/AIKiw49NZtReeh7XqzcSdVHqZoLYZY=;
        b=rUumquFCVZDXqpZpbn+MxioHucnWhvJVfyHuEA9QBHwggrY8Oggj6qnFcIbFqWsMds
         kkZeV0HTL/5rk37df/wVbp/VsGBn1t8U2qRWRRNhIVo+AGkMKjhTtJp/ILzWcq7UdeSo
         Kz9my4QR6IqoeR85PdYT80Kkky9QHMrFC61WIHBGq1ZkMoe66MpXDx5umnNdd9Kg+eZE
         f54UTh2tELVzrk6rGQhRV9DvCufaZ7ZZOsWBEtBJ6I5hc/QlyL1O3OCSNoXpH1ECk7eT
         16EjWfoP8y3Yx86kyeMdAAWwt6Fz9+cJtJHh9w2u7/MXvu6p+jpB3A5AaC+36ND3Llgz
         rSvA==
X-Forwarded-Encrypted: i=1; AFNElJ9plQesvXpTmGPfvhOQZ0zf7/SPMUkQ5q4mP6k+yo5aiUa0dPGVveFLFzG05BQytlobsgEfc8N2@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0iYTSHH8gPiGxXAXXl6hJU5ZzO8cE/pYlXzVc+a9RP9SPlowF
	oksjTCkXlOkN1gwND5S4hjxhVrR1PhlY6XEdPG9XTHKbhFa+NOU6DRXH
X-Gm-Gg: AeBDiesec/dkRU/nsNZFN7LQpZIutz8+9YpMNKGdc3n7dZYugmFoJ4fHVN0whAvFBZW
	5ZjjGjwb5rO0pd+zpjuFwSlAb2HZGPkLCLtmQD4JOZzEqsP8UwAkQQEVuQrXSTJOB5Yg3GOp4Td
	PmX7weMqBk1vv8AvmAYcsHRnGTJm3M6g9JoTaIbsGI7rGxuwf8LjiXEAa8Wr0uwxfqCQF2bESnY
	mrdSdSRcFuWCsIk+sy7nxM9DyW2rx37LwcJHofZJfWOeCIJPsaoQHg59OAlkEJKGJHmU8hlVKJC
	91ZjAordaFjf0i2ocZO0PAeIcX1MwUYOJiqeyKxsj0yulqV6iCVpdbIh+oGMsNyAcKN+cGoDMwx
	7p4o+4mRlLmsxC6X4a9/pmE7hdO2njBE9++Yefo/mtSH3lISDow2x7eECR2gMwjsDfv7mYZXI3f
	DV7YvbUwvnTO32Kop+tOWgrievPi5FQZ9a2x92BBCoq8vntx+9sIz8bFyvTQ3XDxhysH+lrMSTc
	z9lzvYcko9IhVTQnR62AMNKXClOdLcrVSXu/J4=
X-Received: by 2002:a05:6871:758a:b0:42b:ea6d:a8ed with SMTP id 586e51a60fabf-42bea6dda31mr3493259fac.20.1776699550939;
        Mon, 20 Apr 2026 08:39:10 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:73::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930480bbsm8353573fac.4.2026.04.20.08.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 08:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 08:39:08 -0700
Message-Id: <DHY3FCU01RAG.1AACAGEQVBFCY@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Alan Maguire" <alan.maguire@oracle.com>, <sashiko@lists.linux.dev>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH v3 bpf-next 2/6] libbpf: Adjust btf_vlen() to return a
 __u32
X-Mailer: aerc
References: <20260417143023.1551481-3-alan.maguire@oracle.com>
 <20260417170712.74E77C19425@smtp.kernel.org>
 <40708ab6-7a2a-4c7a-8943-88f25c13036c@oracle.com>
In-Reply-To: <40708ab6-7a2a-4c7a-8943-88f25c13036c@oracle.com>

On Mon Apr 20, 2026 at 1:02 AM PDT, Alan Maguire wrote:
> -       return sizeof(struct btf_type) + l[kind].info_sz + vlen * l[kind]=
.elem_sz;
> +       type_size =3D sizeof(struct btf_type) + l[kind].info_sz + vlen * =
l[kind].elem_sz;
> +       if ((size_t)type_size > (size_t)(end_type - (const void *)t)) {
> +               pr_debug("Overflow in type size %d for kind %u\n",
> +                        type_size, kind);
> +               return -EINVAL;
> +       }
> +       return type_size;
>  }
>
> Given that this problem exists separate from the extended vlen series, mi=
ght make more
> sense to send a separate patch targeting the bpf tree for this issue.

Make sense to me. Use check_add_overflow() when you do.
Are you still planning to respin the set ? or is it good to go?

