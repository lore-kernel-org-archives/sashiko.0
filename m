Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613421;
	b=S/APFCYVb93CqHgBQ+m6l9yu0QPi+yiwFgy/NXrU13oBHS+F9mS10iY3t2UcO2lL+18D
	 1JeKtgM5RlWWwOemJya3HzWBxUtjH1egRWSNQZTGQRJObJP2AVyom+cPxW23/x9JuCnEY
	 SNVlVOD3rZ1eTbzVbANbbiydoW/Gvri6U+3iGpPxof8V3kU2ktcR2ZbwK9yanOR1YkYOH
	 J9DafaM8XcAfL/zjMGfOmFntOlAyUuQb8lHDsKdcoy22XRQ0FGpmQoMs25Nk7jDZPpMFx
	 sl5Rig83ZPMaYS3oHfFuvBsKtPiP2Q7E7vKSg9MhCdmxU+XMjAD5n8wW620oXT62XvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613421;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=COGcp38pRmYchvtfFyrxHa2ss+g3u/j/lq+JrxIUIEg=;
	b=OVKXkrmgiogq35kaLWLeCEeBctQtNab9U24MV75UMyZskpMa79tVagz7Oynhv6qdd5T0
	 1WF49IZoCAlvJsy1B+tu3im1Og+SV5be6JXCT18tFMigLcU6bKICJr9rrQuCBVgYBWSUt
	 5qAoAXu9FBo9xAT3jeDGwdcaXGK7vkVFZSGZlzyr8UAe4+j7JPKI3xHnjD9gltzrMpnOp
	 RibEUIKe9vhlot4+asn8y1gscsIuFhy/S6e4jurGe961ezyn2Y0ceLJVl3O88pWtU6vyT
	 gJW5wG1XW9jVBwBdotJHbS6jvx35ubs7ipYHCbkqIpxUpRsfJL5M5gkwz0CEVvMrPCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q3GCHAm3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED91606A319;
	Wed, 21 Oct 2026 20:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q3GCHAm3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9516F1F000C1;
	Wed, 21 Oct 2026 20:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792613421;
	bh=COGcp38pRmYchvtfFyrxHa2ss+g3u/j/lq+JrxIUIEg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Q3GCHAm3T+CHRcFGcmFo8JPTX3LqVr1XDBbEXH8w8KTzvpXD1YZpHNoE5+8Yi5pdS
	 MrWpTOqm+Eh6kX3pJpVpRO5NsZsg/kaf58k1rEld9QWBs084V+NfPhhi9OMAlaAX92
	 Ho36rfgJuKvIPqBHlO2W/I+MDP5wqKhIDZ2euAPQek+81cZKWxJK3B8Bc1odk+d5Eq
	 16XtFmDZl0OMq5qOi+M4snvAo8hZ9CjWF/MnbmkdwRkbIT7hoPGU5bj4kWoFcbzmfJ
	 qy5gH3DRcQip9TjEfR0/AGA2cjXywvEXyJXRRcpG7cpYKjZxAt8O+a6cxaoZHX+N2r
	 Bq1sTP1dlbwEg==
Date: Wed, 21 Oct 2026 22:10:18 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mark Brown <broonie@kernel.org>, Theodore Tso <tytso@mit.edu>, 
    Shuah Khan <skhan@linuxfoundation.org>, 
    Bart Van Assche <bvanassche@acm.org>, johannes.goede@oss.qualcomm.com, 
    ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
In-Reply-To: <20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>
Message-ID: <r48q9oon-p943-7s4r-8n18-o9rp412o5pro@xreary.bet>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet> <atO3pCuUxI950ftN@mit.edu> <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com> <atZ4J86j7CXF82HX@mit.edu> <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org> <ate8oESqneK-3sQJ@mit.edu>
 <7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org> <atic3bbDeyJI6MJs@sirena.co.uk> <atjlUoEmTagZjrYI@mit.edu> <atjpS__OwjZ-Q_Fh@sirena.org.uk> <20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Oct 2026, Andrew Morton wrote:

> If someone's fixing something I don't see much value in
> retaining/maintaining a test case for something we've already fixed. 

There are engineering methodologies which suggest exactly the contrary, 
i.e. to make good use of the fact that we had a bug to add test for, to 
make sure that we never ever regress on it again.

I can come up with quite a few examples where we broke something more than 
once in a row.

-- 
Jiri Kosina
SUSE Labs

