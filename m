Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EFA4D9913
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 21:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778536794; cv=none; b=U73db6IcBUOnEps13U5TqrzQKK8OyA+FF0QFYqT/AEvB6ojedJ4zZZzEKNc/quO4B0h4ctXY663MaP4Mn/KZr18fp4I0B0vtA6guoZxBWDnU4D0GJ/HDlEirIpdeFi2k0opeJ+uiRuAMrY9lqKHz1pLWF5VmgRa1jX7SRqsW6bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778536794; c=relaxed/simple;
	bh=PaQlJJH+b7e+/sFYjOpkFY//rP69dq1K/SjdJHxvTMQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=AICH74zhsrbOpws+WkLQVvWtldm/rE4OKwsXHNOkJRJIkCAgWB0mJs9EUC7iZfmrjD/LzBUNO30pbZNpb7Feu4cVHir83c9owbyFJGMPL1/Zt8A9Y7CK9gAbDNEfV2/HRncMFutPElyvAT6qucgw/mVPxWD1mP5dgBHtwUWLdp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7fiPmu7; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7fiPmu7"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c15849aa2cso6337341eec.0
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 14:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778536792; x=1779141592; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HGG70aLyZXbkyXVoX5cx1ZHQlf1r1TQ7U3Duak5bUAQ=;
        b=b7fiPmu7Q0xdx5cBtQHMN722ns6dsYQe0bFida6B6LBi0wd6e7DTKMaNX4fhCnQzs1
         5Nh4UIweTAPTdnd7SivPsRxWldet/X41ugOrgJKXg2OmBJ/sVn9s9JznzqOyyeLEJo4C
         KXrnc0CZRMJnuzkVqW/q1Fe0hugO1phuExOBHraqeSWzRiP3HHjMWm007rj6yrlmPiDm
         dR3TGU2Fwy7AI0B4/dzppstKQBSsPnNM8KvYB7qLFJVgZsZBItaSXTT+T+3qMH82UHVr
         RdWRdxlzFM9zUF45RkiXimFTY4bMOOrh/+tgsSlT0o6FvJNUpQl4JaAivKXuKLtMKzgJ
         bNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778536792; x=1779141592;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGG70aLyZXbkyXVoX5cx1ZHQlf1r1TQ7U3Duak5bUAQ=;
        b=j4LP7g5ecpRwdRUUseJ7hqDJ3A72jifYF2T0hXMF1ztAgQMf5nzjwe1FTk4YuBKuiU
         wZRWqOrR3+LefftOGwufBHTld8mmunZcvNcDWNafabr5VdiAU8lg2TKoOxB8zcMHvI9i
         ozlGH/QUgBvxx5Y1PokKNHSndWC4BbVYB5aXKDAZUal8oiZovUuYzhOFkTGjQfzdjRdC
         J8kKR0ixYH7QRS7pROtGx4WGefApg73+nuT9WZ1HdNZCGiZLExXPm0yiqjL9i4q+RoLA
         izgqvO52gYnyi2lxUmHV1Ea4xIEtJBTB3rq/JnoCwJCndUkL3LZJPO599ydE2EyXuSH0
         wAFg==
X-Gm-Message-State: AOJu0YyVgF/aHj+xyQAC0xd54vFcIpR8QM4wDT3YzRDL1e5jDnE4cEJl
	BbHyUE+G97B6sv9N7qL3DFRefiQ54UhacrIIjIk1L9ezvCF6/zB/MHbZgRg0jQ==
X-Gm-Gg: Acq92OF8kqz5u8I/s4H/e4BOAhy7ky+21iXr3bv2occeXGlTitihIfN6lN1BSEDefaz
	gMzrNU4HwXcaP2JhooRmYTRhFGRljiKQhN88aX9aWmUU4eIaC+IbHGIBGSE1yWfAuAfg2nk4vsO
	IcZLDkDrAqvJq101hHs78QgJFEv5AImK+L7qneJLcEQkVuFK7bAdvJKYORiA/zU908W3Wsbwe2u
	RBBSig5u/PrQu8WPyq6gklp3ej38PbQp6vZt3xuWS/fVrc1F0rMHOZms6ecOcdTmL4Rsm0kJZeY
	keR0whkzVC96GS4ipCYSzaFqHXyEiAunJiACYQpAoX/GPar31k7iwcD+ttMoDt3Dj0TwaKxP0pj
	+nwAWfGg/+wZYcu0sjWU0LEeyLBYwnPbpiJ9MH/0lStuiK7zzrxCK1lK22eYJ15r4hgvNtBOSBz
	U9bzQHsZjrrpI/2aFUYJ0OeoBNqJxtFWlvC632C0qfSyPBnIFB3HPbU3bmfGSrvNYjADGFH82c9
	QLFFXud6bO4nSbaRYIq+w==
X-Received: by 2002:a05:7301:4b18:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-2ffd88bcd1amr222141eec.34.1778536791780;
        Mon, 11 May 2026 14:59:51 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafacsm15107022eec.1.2026.05.11.14.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 14:59:51 -0700 (PDT)
Date: Mon, 11 May 2026 14:59:52 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: sashiko@lists.linux.dev, sashiko-bot@kernel.org
CC: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH 2/4] HID: hid-msi-claw: Add M-key mapping attributes
User-Agent: Thunderbird for Android
In-Reply-To: <20260511205107.C2030C2BCB0@smtp.kernel.org>
References: <20260510043510.442807-3-derekjohn.clark@gmail.com> <20260511205107.C2030C2BCB0@smtp.kernel.org>
Message-ID: <70F3879B-AEFF-4CFD-9CC3-2BA477D97D9F@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 11, 2026 1:51:07 PM PDT, sashiko-bot@kernel=2Eorg wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>- [High] Data race on `drvdata->profile_pending` and lack of transaction =
atomicity during concurrent sysfs accesses=2E
>--
>
>commit b9bc6d29326e3dd3ed065aca7059668a1b674bc8
>Author: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>
>HID: hid-msi-claw: Add M-key mapping attributes
>
>Adds sysfs attributes to remap the M1 and M2 rear buttons to up to 5 even=
ts
>(gamepad, keyboard, or mouse) when in macro mode=2E
>
>> diff --git a/drivers/hid/hid-msi-claw=2Ec b/drivers/hid/hid-msi-claw=2E=
c
>> index 7a3cd940ec49e=2E=2E60694d075d56f 100644
>> --- a/drivers/hid/hid-msi-claw=2Ec
>> +++ b/drivers/hid/hid-msi-claw=2Ec
>[ =2E=2E=2E ]
>> +static int claw_buttons_store(struct device *dev, const char *buf, u8 =
mkey_idx)
>> +{
>[ =2E=2E=2E ]
>> +set_buttons:
>> +	ret =3D mcu_property_out(hdev, CLAW_COMMAND_TYPE_WRITE_PROFILE_DATA, =
data, len, 8);
>> +	if (ret < 0)
>> +		goto err_free;
>> +
>> +	ret =3D mcu_property_out(hdev, CLAW_COMMAND_TYPE_SYNC_TO_ROM, NULL, 0=
, 0);
>
>Is it possible for concurrent writers to interleave these commands?
>
>Looking at mcu_property_out(), it takes the cfg_mutex internally, but the=
re
>is no lock held across both calls here=2E If a second writer executes its
>WRITE_PROFILE_DATA before the first writer executes SYNC_TO_ROM, could th=
e MCU
>be left in an inconsistent state?
>

No, the sync to rom simply writes the state to permanent memory so it rema=
ins in the same configuration after a power cycle=2E The first call writes =
it to temporary storage=2E

>[ =2E=2E=2E ]
>> +static int claw_buttons_show(struct device *dev, char *buf, enum claw_=
key_index m_key)
>> +{
>[ =2E=2E=2E ]
>> +	codes =3D (m_key =3D=3D CLAW_KEY_M1) ? drvdata->m1_codes : drvdata->m=
2_codes;
>> +	drvdata->profile_pending =3D (m_key =3D=3D CLAW_KEY_M1) ? CLAW_M1_PEN=
DING : CLAW_M2_PENDING;
>> +
>> +	ret =3D mcu_property_out(hdev, CLAW_COMMAND_TYPE_READ_PROFILE, data, =
len, 8);
>
>Can concurrent reads of button_m1 and button_m2 race and corrupt the
>profile_pending state?
>
>If Thread A and Thread B access the sysfs attributes simultaneously,
>profile_pending is updated locklessly here before mcu_property_out() take=
s
>the cfg_mutex=2E
>
>Could Thread B overwrite profile_pending to CLAW_M2_PENDING before Thread=
 A's
>command executes? If so, when the hardware replies to Thread A's M1 comma=
nd,
>claw_profile_event() might route Thread A's data into Thread B's m2_codes
>buffer and clear the state to CLAW_NO_PENDING=2E
>
>This would cause Thread B's subsequent reply to be dropped and trigger th=
e
>"Got profile event without changes pending" warning=2E
>
Possible=2E I'll look at improving this pattern by managing the pending fl=
ag with a mutex=2E
- Derek

