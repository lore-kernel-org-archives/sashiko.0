Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792463323;
	b=VNh7vALacP1aUtpRzSrR1iF4qKL9JhQ1ATvVw2WQnmiqU7YAIfM8RV7Fw65PX5zskWF/
	 Q5bERMWrARhmmRlkCUi09QR0qFtH/26oxisMV2N/GK4b0QOTEqSx6W8Q8a5zyENbdOtlL
	 VA/QJyBesITxLhCLBiF68rGVZnYd3iXSqmBYK0dSQMq3Nw8fSI1koXCKGQB9P8z/ifDdd
	 cGO/22vlG54QXYaSFzZB8OzEwSUIT7I+XgwprJN1kZU/cPJF33MBOr4q2bDDo5hZVU1Fy
	 jYoscAF7s4M2HDdZU00DgRlqbidptkn/f3yyHoTnqogFCDzMwBkJGvneW4tH/6g7rHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792463323;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=osXNR9BiljiH8nBbsqhC0TD62cEKtYfRW82GgzEDGYQ=;
	b=vXnoJhe3qmMvi455oGVXkIstPx5/G4dLiHb0RZIGWbg91v06Ac2dLdU8gyoL7u5qNLv4
	 o81iWDIeSKtapFxFvRuFlbA5p/taZRTSPKIOPh6ZCOLClwDihLBTO4ViTbF+ogp45ZT+b
	 NRZS5ixZWPDW6TPlFpuK5Lz9vFbB04AG8iMct2XLsF648BWN7XhjPnTez33HtI3ObSsqI
	 iSa+uRe7HqxrT7wagz7KLSD8D0X+JwplQQnDUC6X98M+YsshRVW5v8V6Tu0CczWL9Zy6j
	 1hamGMhjRn3TDJ0Osc7TFuLxWiO+SMXIYkKCxNd1pUA5SniXBfoHt4zBq/ojhXvgXFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cyLSBHLq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778C9606A322
	for <sashiko@lists.linux.dev>; Tue, 20 Oct 2026 02:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cyLSBHLq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293D81F000C8
	for <sashiko@lists.linux.dev>; Tue, 20 Oct 2026 02:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792463323;
	bh=osXNR9BiljiH8nBbsqhC0TD62cEKtYfRW82GgzEDGYQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cyLSBHLqy+10dzTY88yA5JRXdMnDrks8GoeW49gihdHyPETEPgBhpR15Ton8I3oyq
	 BOIaU/hRMmPP6HAJwcA57psfSa10WqpObfPC0ihD4id9WBi/iQlS41iAHq9l8pbsT/
	 9cdiI2wxezdYKjsN7D/oVl1LdF3k/THmqr7GLbu580RjGrMIJqymm5BgIQFjkxyHrz
	 rE/aE6Oj1fKJeVQ99rle0GA3xu07EX9/T3I0elXIaSQ0vjm0MhK6EUj3PWqunT9M3K
	 NjiweKuBeYuEt1pTAlJoG/nnh5RtfMFM15wsBVW3RjuXsK2lgroZVzF4GbfBnQk0R9
	 UUdNmcnduimeg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab27e45e7cso18047301fa.3
        for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 19:28:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4ea7Q9A2WX+G+as/GqmmxItmRaLVjGLeuoR/KGjLOUXEOdBgTX6bOnsaZ5MnS85hFP/MAdHTk@lists.linux.dev
X-Gm-Message-State: AFq9FYIWUMfUDH5H/WThNZRNFogQSK1qtAwoXRWR7QhAzF9J2I44v1os
	3DGJgvoWCKPhMCkdkr3y/kV3yCBAOacySt1aZNw/zz3oHRRjMbXH286esZgdmRIVQ5KLA705koS
	j4ayOX66OpM0+4UBXpyhYq11Fari8VI0=
X-Received: by 2002:a05:651c:43dc:20b0:3a9:df30:3d54 with SMTP id
 38308e7fff4ca-3ab2928c68bmr14858021fa.19.1792463321631; Mon, 19 Oct 2026
 19:28:41 -0700 (PDT)
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <350c7564-a833-4dd4-abf3-b8488280b0fa@kernel.org> <a6670d97-bf2f-4027-95a8-c091144725c1@linuxfoundation.org>
 <atZ-V08qv8SHD3ZZ@mit.edu>
In-Reply-To: <atZ-V08qv8SHD3ZZ@mit.edu>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 20 Oct 2026 10:28:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v66=MeqEgfYTpEkLYaxxjCpkzGq8OMcZ_9Kn4HJvyzT0Ng@mail.gmail.com>
X-Gm-Features: AclHuK83APok1jmtmVektEz7mnCfyDJHngcvYJrSVjmsEEcpFAtr1vO803YjWEc
Message-ID: <CAGb2v66=MeqEgfYTpEkLYaxxjCpkzGq8OMcZ_9Kn4HJvyzT0Ng@mail.gmail.com>
Subject: Re: Patch pre-submission to Sashiko
To: Theodore Tso <tytso@mit.edu>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev, sashiko@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 4:36=E2=80=AFAM Theodore Tso <tytso@mit.edu> wrote:
>
> On Mon, Oct 19, 2026 at 11:53:27AM -0500, Shuah Khan wrote:
> >
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
> sub-agent.  We would probably want to make it easier for LLM's to run
> our kunit and selftests as well.  Basically, we want to push the work
> to the submmiter, instead of expecting the maintainer and/or reviewers
> to do that work --- especially since if it's in the agenting coding
> loop, the LLM agent can fix the problem more quickly and without
> burning human review time.

AFAIK this is already possible as Roman mentioned in his presentation
at LPC.

And if Sashiko is too heavy or slightly harder to integrate, it is also
possible to just load the review prompts. Roman did point out to me in
private that this is not equivalent to running Sashiko though. This is
what I'm currently using at work.


ChenYu
