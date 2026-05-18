Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF773388373
	for <sashiko@lists.linux.dev>; Mon, 18 May 2026 17:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124806; cv=none; b=QRbXnRQuAM3mGgLAjl709HkKXiBiCHAm/vYCOqQ6BeTRXTARNEC2RtWGgIYCpLcqLaLYeehqXdPoPdTSA/OkvoAiPe8SHeTjXF9GSOPkHNKKZ2piRYW3dP5HxQd7gNL83Hd0iqj4c604pw6hBecGf7tq9MIOGn57mVH/lubGkZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124806; c=relaxed/simple;
	bh=YbH3DLcjmOdU13NbufJjfw1GtVpWCi0PlKxThHTimAc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=FHDE1DB/ZbNmue7V1ThCUdEDbrxbyzz8DPjXny/UtonR+ILnSugFlz6Cf8mh2y2OGkpdJc9llIrsXZfBPqfmh7IW9ZMK1ZQ2i83MCeT/AT4BWV/IhSayXpRXehMTE08BEWYCKnJ5M4CtyOB4oJxQbPme6/6+61+U/idw+/nZTjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DNOVWCKi; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DNOVWCKi"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779124801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YbH3DLcjmOdU13NbufJjfw1GtVpWCi0PlKxThHTimAc=;
	b=DNOVWCKi7aFf6VFu/JC0wRZfu4ECTL91fCym+9XSX+Fm5qUctR41mQ/ZOAdvjk0MzP2Mlt
	bYpo2XJql9RK9JTWxzt9BduCNeknOPwspY+NUxHb6IQx8kLn7EZsiplkt12ruEqtbRQViT
	C/kXQotvjMBuy0HPNhIB+WxpFzmK1Cw=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Stop false review statements
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <DIL2P8CHKVZD.2WVQQRN0FM28N@kernel.org>
Date: Mon, 18 May 2026 10:19:47 -0700
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <mricon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Miguel Ojeda <ojeda@kernel.org>,
 sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
Message-Id: <C16C14F1-4D2F-4701-88CC-114F5233980D@linux.dev>
References: <DIL2P8CHKVZD.2WVQQRN0FM28N@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT


> On May 17, 2026, at 8:56=E2=80=AFAM, Danilo Krummrich <dakr@kernel.org> wr=
ote:
>=20
> =EF=BB=BFOn Sat May 16, 2026 at 9:15 PM CEST, Roman Gushchin wrote:
>> I agree, it=E2=80=99s sometimes gets tricky when a patchset is sent to mu=
ltiple
>> mailing lists, which policy to apply. I have some improvements in my plan=
s,
>> but it=E2=80=99s not always possible to say how it should be handled.
>=20
> Which improvements do you have in mind?

If a patchset is sent to multiple mailing lists now Sashiko is using the sup=
erset of
email policies. But in many cases it=E2=80=99s possible to determine the =E2=
=80=9Cmain=E2=80=9D mailing list/subsystem
and prefer it=E2=80=99s configuration. Not always.

>=20
>> It=E2=80=99s not fundamentally new: landing changes touching multiple sub=
systems is
>> always harder exactly because maintainers might have different and someti=
mes
>> conflicting views.
>=20
> It can also be relevant in cases where only a single subsystem is touched.=

>=20
> For instance, in the case of Rust, the rust-for-linux list serves two purp=
oses
> -- when it is a Rust subsystem change and when Rust code of any other subs=
ystem
> is touched, i.e. the rust-for-linux list has more of a LKML character and a=
lso
> receives patches for subsystems whose maintainers may not have opted in to=

> sashiko email delivery.
>=20
> That said, I personally don't mind too much, I really like sashiko, which i=
s
> also why I asked for adding the driver-core list. My experience has been t=
hat it
> does a very decent job in providing feedback for C code; my feeling is tha=
t
> feedback for Rust code is not quite on par yet, but of course it also high=
ly
> depends on the complexity and scope of the corresponding changes.

This is super interesting. An obvious idea is that the training set is relat=
ively limited,
if we=E2=80=99re talking rust for kernel code. Did you notice any common top=
ics or patterns?
Does it produce more false positives or worse in finding actual bugs in comp=
arison
to the c code?

> However, I still have the same concern I raised previously when it comes t=
o
> email delivery: I think that when sashiko sends feedback to contributors
> (without Cc'ing the mailing list and all other recipients), it should acti=
vely
> ask the contributor to raise things on the list with all other recipients,=

> reviewers and maintainers before acting on them, such that changes subsequ=
ent to
> the first submission on the list are aligned.

I personally think that it=E2=80=99s always better to cc some mailing list a=
nd/or maintainers,
so there is a second pair of eyes. I totally agree that replying just to the=
 author is less effective.
Of course, we can add the text you=E2=80=99re proposing, but why not simply c=
onfigure sashiko=20
to cc the mailing list?

Thanks!=
