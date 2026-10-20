Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485372;
	b=3+ive/2n13fgtMxkpDwtZqn8B6D6lpzL359fiyiv249vrlFAMpsRHwBQKG3hj+Wb+4Zp
	 5B+lYeAoDz2CQrdYeo+967S8Am82SuY/PCoAWiDhjX3ol5nNx8PmxF2HWZ3oYCfSxYe3g
	 vdrPlmt4RePzwshqXrq9paErW2zAeq49kOCCwT4NhaQwlht6P8YNC7g9sG/Gj0XivAyO4
	 Duk8ODGdj7ydZlWSMHYfuAa4SMfSCMKF46MozjwYA3uaMX+BJKMh0qk1Tn14nTD5J7xiT
	 rwmnYC5lyfBqE+u7y/lmDoZIC3zfgxr5jVoJQfgO+R+2vBjV5W8Ui9zrdTAHPQJHT0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485372;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type;
	bh=v2sqWtaMsoK5yP0npF8R8T+peM+iezxl57A88LBOAuw=;
	b=OKK4yFLQe4I2WWFb/RRIAUomWB3ImSFS9uD7T3vPShVRKzY1y2WcuePUc16fjxscnepW
	 GTYQ4STVIuBWSys5DKnNsy7hhI8tnQ6Prl+EnoaU//b9VSC+bb1sX5j19TjX2VU9atAJL
	 IklfD97sP5kUF8ffzY/yUXhpb/EIaeV+PxnsMZUpl5uOC3VbvREiF7ZmlBQJtwe+PdihH
	 s3U6AHRs8PqU1HBUY2VGtO4iYUBPfM7QB0LXj298HLLsTr0Zg4+dueg1bpq/jwk2LGrll
	 hccwBGJw4cgMEdE0PAdfCUhhj7/36fQMCtLD2mWa1BGsIYIVL/JWk+9kMoI/YrCKYTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lXCB/6Wp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE80606A31C;
	Tue, 20 Oct 2026 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lXCB/6Wp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0461F000C8;
	Tue, 20 Oct 2026 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792485371;
	bh=v2sqWtaMsoK5yP0npF8R8T+peM+iezxl57A88LBOAuw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=lXCB/6WpjF2cW5fZOF/tMgUAm8DCz5jtmd4souPECjGtgutUpmejWqyKtCi6EJFXW
	 Qwbsy+APYTOmBnMwm8dkyH0Nt0knDGB1mM7pW0ASefSw2VgLL/jd3BcA2Zle7ltvH+
	 O0KE+3QBXbck88m5YYl29JsL3P5h3JuJaxc4DLLVEWpa+3Ja71vcFs9BAZPDsrGQsp
	 Qw/Y3VpFng5iAArAEylpv7oQ59xg8qDJbHkkplMMhd5b+MxN6AjK6WqYYOFKr+sEXB
	 U78i2fWGHgpSsrsMZmmROFpMK+bBKgcAbKMAdhhMnwFzT/2fY9efZBZ5Bvcny/ZdNs
	 NdCgqy7ng4sZw==
Date: Tue, 20 Oct 2026 10:36:09 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Theodore Tso <tytso@mit.edu>
cc: Shuah Khan <skhan@linuxfoundation.org>, 
    Krzysztof Kozlowski <krzk@kernel.org>, ksummit@lists.linux.dev, 
    sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
In-Reply-To: <atZ-V08qv8SHD3ZZ@mit.edu>
Message-ID: <51o8r2nr-s30s-q915-58q2-2q4nr08006ns@xreary.bet>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet> <350c7564-a833-4dd4-abf3-b8488280b0fa@kernel.org> <a6670d97-bf2f-4027-95a8-c091144725c1@linuxfoundation.org> <atZ-V08qv8SHD3ZZ@mit.edu>
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

On Mon, 19 Oct 2026, Theodore Tso wrote:

> > When a submitter uses LLMs to generate a patch, it is reasonable for
> > maintainers and reviewers to ask them to use shashiko to find problems
> > before sending it to us. Asking for a shashkiko run before submitting
> > patches could become part of the patch submitting process.
> > 
> > How about updating the submitting patches document to add a section on
> > this with instructions on how to run it?
> > 
> > This shifts the responsibility to run shashiko to people using LLMs.
> 
> If people are using LLM's to generate a patch, it would be useful if
> we can make it super easy for LLM's to call out to Sashiko as an
> sub-agent.  

Yeah, but that pretty much brings us back to the potentially problematic 
"free tokens for anybody developing out-of-tree / proprietary kernel code" 
territory again.

-- 
Jiri Kosina
SUSE Labs

