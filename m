Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196CE27A91D;
	Mon, 19 Oct 2026 12:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414666; cv=none; b=Re852DD46e/YoWakXGePIiM745pLjnZRkPsTj8r6A98YVX/WmOEj92yjbnq9TFI1XcTl+DI32SKlpPBk4iDFwnLNG2zS3LVqvk6sxlMQsmXlja/GHj5ePxIBZZ8Xlnr24CURbH+o+eojgg5JU0IyBa3/lDg8maa0MDpnoyOx8dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414666; c=relaxed/simple;
	bh=mL4UVolenHJM0h8Yu/UsECMSsoSuKxrKH4E21jODDfI=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=Jn78ofEcoCHsA2dA08ERO3YlueoobGSer/s3Fskd5L5R4noCVBzhq4ZhfG82t/QnNFq9BdxqEt3VQCxWP7lWWLeMQJ28iPpsBNv+UTFZIgdpOtrvhm3x8hUYRmIxxNK6F9ABHhmoi97cu1Jvlm1iFPvTP5amJnVYLi+Ue+/zqFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=G09fn4zC; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="G09fn4zC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=content-transfer-encoding:from:mime-version:subject:date:
   message-id:references:cc:in-reply-to:to;
  bh=mL4UVolenHJM0h8Yu/UsECMSsoSuKxrKH4E21jODDfI=;
  b=G09fn4zCDmreUr4v5MwiH1eNTYdCXAKa12JmLQV9utzF72za1aKOuk3G
   1X+gPrjUjrfMmmXgkqsYy3t6y3xG51NuHHKo82B95qwwXeV2V3W5UaN+S
   agjMxq8+cDntLlbB7zRNIhumO06qhFRllSx4dbMzJ58zm9xpNUAtVcxft
   w=;
X-CSE-ConnectionGUID: STXiFlweQLGlYuk2J00Czg==
X-CSE-MsgGUID: vCSka6BeQda1jy/6TcwX1w==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,167,1787004000"; 
   d="scan'208";a="300896877"
Received: from c-76-123-3-53.hsd1.va.comcast.net (HELO smtpclient.apple) ([76.123.3.53])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 14:57:35 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Julia Lawall <Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: Patch pre-submission to Sashiko
Date: Mon, 19 Oct 2026 08:57:23 -0400
Message-Id: <55AD23E0-119B-46D3-8E1B-676686BB1CDB@inria.fr>
References: <6e66c03d-4c96-4199-b45d-42a0abe251e2@monstr.eu>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 ksummit@lists.linux.dev, sashiko@lists.linux.dev
In-Reply-To: <6e66c03d-4c96-4199-b45d-42a0abe251e2@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
X-Mailer: iPhone Mail (23E261)



> On 19 Oct 2026, at 08:46, Michal Simek <monstr@monstr.eu> wrote:
>=20
> =EF=BB=BF
>=20
>> On 10/19/26 14:02, Julia Lawall wrote:
>>> On Mon, 19 Oct 2026, Michal Simek wrote:
>>>=20
>>>=20
>>> On 10/19/26 09:26, David Woodhouse wrote:
>>>> On Mon, 2026-10-19 at 08:25 +0200, Krzysztof Kozlowski wrote:
>>>>> I assume you mean they will be running it through Sashiko
>>>>> infrastructure, so using sponsored tokens. Otherwise that possibility i=
s
>>>>> already there - you can run Sashiko, just a matter of money.
>>>>=20
>>>> I have a patchset in flight where I *have* been running Sashiko (as
>>>> well as lots of self-tests) locally, and then got further feedback on
>>>> the list from the public Sashiko which my own run hadn't seen. Twice.
>>>>=20
>>>> I still need to send v3...
>>>=20
>>> Isn't it better to create a new mailing list and filter all CCs/To?
>>> People can send patches to that mailing list and get reply without CCing=

>>> maintainers and mailing lists. They can run a lot of iterations like tha=
t.
>>> When it is clear they can send clear v1 in a normal way.
>> This isn't just free tokens for anyone who wants to make a change to the
>> Linux kernel, not necessarily a change that will ever be sent to a
>> maintainer?
> Isn't this something what people can do even now? They will only keep mail=
ing list and maintainer in CC.

There is still the illusion that the code risks ending up in the kernel. I g=
uess that even with the Sashiko only list the code is still public, so perha=
ps that is dissuasive.


>=20
> Thanks,
> Michal
>=20
> --
> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Xilinx Microblaze
> Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
> U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
> TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs
>=20

