Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B528326A1B9
	for <sashiko@lists.linux.dev>; Sun, 12 Apr 2026 01:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775956460; cv=pass; b=VZSHD9uptKHQlyMUyzsf2F6bsyACk7vQQqzbiKT4Hqu6Tyvd9lapIMI/xMvMMr64m+EFfDYL/w34bDUpcyHyjBGBMXGsuwjhTix5B8i27bR5qFyzZqQm1LxkKqDdeRM927SZtU1IPrmRlmkl13J5vKipjqn/pbvH/78o1a2fps0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775956460; c=relaxed/simple;
	bh=Ubu2BKqCV9U+N5NgZ9KEZNJCg58RCPUVHhvzRbPycMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFFtpOiDKHw6gdi8tfepg52TUyFS1MzMdgZClSVhiNJGr9vBfZ1KT2ab1KrgHcSLWG2PVE0AsHsOE2CG/lKMO6MJS166J7efRBEJAoGtrDBwmgKoeu+sLhuB9WcJ87iCSMHAwx/B9+doaWUT4ww7DAuJVVLYffzvFw2qp/xuyHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ef1yEoXL; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ef1yEoXL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso22805ad.0
        for <sashiko@lists.linux.dev>; Sat, 11 Apr 2026 18:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775956459; cv=none;
        d=google.com; s=arc-20240605;
        b=hmiO0+wzsXbDkKo7Qru4jRq0pCp65mdzf0AXpMGLDQVW/tWtUM/JObpGz2I72GXB/A
         gdIAXb+XWoVvug3EzPshyhO2bNjQXnxvapMfX1d8P/0V535PvulNKZ8YahJIKjhT8+Tj
         Tr4oZt3Vurd+ZXvxasnYsbwB14hEhJbOt+xtP7rYs+x4X18/boWOmCigYzThdeAY2AzW
         98VoWKzJAIOj7RIFYsWl87FZkxTtlTwSip/hEvkE+zCaTer22hg/s7isossdnRDoboYn
         hUtfngnvoFScsUu0GMGNUljqPCTZn8LKMZuNF8+P9smjp9h+ZdSEnua4FUfKzDVDkuyp
         U2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/AZhzxqPX5mqnjiLPy+maGxKzzx2/k1Y1sKM4rH1bFo=;
        fh=7h0izHys8KHgVwAHFbDqh8DXgNjj235aXcN4iZY+6bA=;
        b=CXVnsNGab6dMQwHYkyOCLEE4byG1rcMIt32VVckx3XwLP37056Nilc8iak2f8jjfVb
         IxMSg/k6LOCBDI2ZN42hFlaAkanuSEX4uoRljuiQd/VOvKW7Ss1qvEdTqHBU7tG6j+oT
         VAHvy97vpXUkTlXaT6eY+PH2OOvPMFtVkipXq4/11qoHBOsjQHUeV6qZvwlOjqXFuFyv
         +4tZgXru8CGNubGRP6S4O7CNeMMADZPyASA7K5fuSaOICHKjRUIbqSHrr6j2r/62KFAp
         FOo9ray5/c4LiGmpm/6xq1flqAFdj0VazawxviwiroQPf8UilLkESk6V8YT3XtDXppkq
         Ltpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775956459; x=1776561259; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AZhzxqPX5mqnjiLPy+maGxKzzx2/k1Y1sKM4rH1bFo=;
        b=ef1yEoXL1O4QV9N4GGv9AiPv26sVQX3sXB2ZeEWxaPFaOvf+W4SGaQg8ELjc8M/Cd/
         oO2tivVJGeFvKlR1Wa1Ja7kOW/hXlMQl7WKt0ZKPjv4HO8a3v3QicjTnesRpZuGYvYO2
         Vptk4r5ByVcYoQejddXEymcVHwQSqg9tPJaq2jmynMWFxNBGDQu2BOtFqgxlD5f7LII4
         nIWSCVJCkm2lKvhnwY+shcBO7PBoURyHAQ7Ln8LtioiOet39mLVYbTmDY8VnseL5AybG
         yKJ4VafgV3ghGBKNuSBTuZnQGKkHI8U5pFtqAjujy8LLp4mStFXOj3+onBbnr3HpPJog
         Jxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775956459; x=1776561259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/AZhzxqPX5mqnjiLPy+maGxKzzx2/k1Y1sKM4rH1bFo=;
        b=dJZw/hTK09tLIzcob5nGRwsV80ruNjb5vKI1Whibz2WV3dmv1vQTbbfw8G9Wa0YRRh
         Mwrq3cu6OKqBjcq3jM7GXkItMPBsdWizfzUVJlY9Fn4UkVLKIehaGRbKs8HhnAcR7vS3
         kgf43zvvlJS8/+BEfPEsFl7kAQNKsAT4KuydrCDBj+UBPio4XrCf1Om7JIV+T+UdBf+S
         4xqkk6qsCRRPh4qSEVJQF3vAlHJTnuUSM6NS14N4SCdguQspfOnJHilrtE71crc36A+0
         yLQwAF/wUe5TuKlhBunB/x2mdmsngdk5lzCzLrTqBWRSS8UBuPQVfx5MNh2rfJGhI1Cb
         s3JQ==
X-Gm-Message-State: AOJu0Yw3DE2U7h1aG95V/ipT96PNV6BF27Q9+L9jgPCJsUdvmtaXjtVG
	2N4OlS9V6KY/8QRVESw6/8YxojNnpLNS0o4ifLLQ1MKtsslkw/LeTrm5NOcxGvmLw1VZ+jVmBV0
	ppzmT0OkS0hrgtj4EhnqJewLFPszs30xeB16Eg3dOoU7eLSc5IiK1V1Q3
X-Gm-Gg: AeBDies4W5ddsM7mREl3h2wTnXVFBZHh2Xxte4EwugNjJbfkqAGsAICUp3fp7fL+24N
	kaG/fUDooGlAVmQZmdP3VZJe8a8WGRjBZ+UMfNxHD2bGPRPZuI4mRLNzlbb1BGP3Bqf4pM3whTZ
	fasi7srmZyzuOu9995Qz3C1h4p2Z36a8HbfVoJXfTGcUxUCBHcIj00ZrwBJnRpP+sM8NFgVi8ex
	XmQTnTx+IQtpBAJIUTMFz2PBoAK57Mqhsnhpeq349D6cNYfYnfc8qBInfPnDO0z0fMPXTwfZt/v
	O8g0sSl3jPSp572N/qE=
X-Received: by 2002:a17:903:2b0f:b0:2b0:5e19:1862 with SMTP id
 d9443c01a7336-2b2c8c74a19mr9132395ad.5.1775956458063; Sat, 11 Apr 2026
 18:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411193705.735269-1-irogers@google.com> <20260411195423.4C949C2BCAF@smtp.kernel.org>
In-Reply-To: <20260411195423.4C949C2BCAF@smtp.kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sat, 11 Apr 2026 18:14:05 -0700
X-Gm-Features: AQROBzCzmRC6_AJAS-FddXGPSNJ2tzJQjoSrAk5fV3Wn_jV8Rz-zjmDJ4IIO1Rk
Message-ID: <CAP-5=fUvMcBbHTumUVRmxFA7OL6bBP-bC9SUeWHDi5XQJ=ZWkg@mail.gmail.com>
Subject: Re: [PATCH v2] perf test: Fix inet_pton probe failure and unroll call graph
To: sashiko@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 12:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 1 potential issue(s):
> - [Medium] Unconditionally requiring DWARF call-graphs causes the test to=
 falsely fail on perf builds lacking DWARF support.
> --
>
> commit dbec7073d294917f7866e8ea3a6b39004a7407ad
> Author: Ian Rogers <irogers@google.com>
>
> perf test: Fix inet_pton probe failure and unroll call graph
>
> This commit fixes an issue where multiple identical event names were outp=
ut
> by perf probe when creating multiple probe points, which broke subsequent
> commands. It also updates the backtrace collection to explicitly request
> dwarf call-graphs and increases max-stack to 8 for all architectures.
>
> > diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/to=
ols/perf/tests/shell/record+probe_libc_inet_pton.sh
> > index ab99bef556bf0..eca629ee83f03 100755
> > --- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> > +++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
> [ ... ]
> > @@ -40,12 +40,12 @@ trace_libc_inet_pton_backtrace() {
> >       echo ".*inet_pton\+0x[[:xdigit:]]+[[:space:]]\($libc|inlined\)$" =
>> $expected
> >       case "$(uname -m)" in
> >       s390x)
> > -             eventattr=3D'call-graph=3Ddwarf,max-stack=3D4'
> > +             eventattr=3D'call-graph=3Ddwarf,max-stack=3D8'
> >               echo "((__GI_)?getaddrinfo|text_to_binary_address)\+0x[[:=
xdigit:]]+[[:space:]]\($libc|inlined\)$" >> $expected
> >               echo "(gaih_inet|main)\+0x[[:xdigit:]]+[[:space:]]\(inlin=
ed|.*/bin/ping.*\)$" >> $expected
> >               ;;
> >       *)
> > -             eventattr=3D'max-stack=3D4'
> > +             eventattr=3D'call-graph=3Ddwarf,max-stack=3D8'
>
> Will this cause the test to falsely fail on perf builds lacking DWARF sup=
port?
>
> If perf is compiled without libunwind or libdw, running perf record with
> call-graph=3Ddwarf will exit with an error. Since the test script doesn't
> appear to verify DWARF support before running, the test will report a har=
d
> failure rather than gracefully skipping on minimal perf builds.

Since perf probe requires libdw and libunwind is deprecated this isn't
a concern.

Thanks,
Ian

> >               echo ".*(\+0x[[:xdigit:]]+|\[unknown\])[[:space:]]\(.*/bi=
n/ping.*\)$" >> $expected
> >               ;;
> >       esac
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260411193705.73=
5269-1-irogers@google.com?part=3D1
