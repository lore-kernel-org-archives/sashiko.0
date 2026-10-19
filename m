Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432413;
	b=1uzziENWrJrjflIuLIYHwh27LCnzJmINfPYO6pZ0FxPgToA2TvEoi5KoPiDAY/3vxBKw
	 0SvZHwW51NKMweUyLqnTgThEs/8kr4YXOhMMsSI0vyan/3lr3rn3xEl3ykVI7FgOdkFzp
	 EgTMZGh6Mf48pP8K09ZerQuTRNY+9QgJhvYms1nRGSjiqTXMfcTifIM+VxhyY2lBvjgep
	 Evhcxn+BT0ZFkyMdw1wj07SHBZOmGOpM5/rumSEZF9IYZWK9rVJRqPeZbEu5Fjop4zgzJ
	 knEx8NDiLPDHkNqhLCMB2O3CAQjz8Z5fd0yVxYXNg4pQUI7O0VaZXlVKCHmYPGT70NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=U026smUJcD1WeuJ4KQ86+20/5ae5gjgHhLL6yY5chg8=;
	b=hA5OiUdvRygRnbl+O7vycYbdzJC/PBg42Vmb4bl4Ymjko+mRvfUHQLYagCQbDMev7vtk
	 Sx5pptIaVtjI/LNdrY+daIU5DSGQHT9oFoRHOSykkNFhFs/WSTCqoQ+RZLujwpFMnFEE0
	 c913Wd8pQ6UwKj81q+9wy2PBVx2ooQgwd5GQx8N1fq5vuCwQ7jgy+MqUefDNg0yA76bYl
	 NInmRoVhklvKRKZ0+ylg4uqFtLLgBmtYNn4qFhAt/k5bz5QYnf1ny2E6WpmjMaflJlTr7
	 /8JmChnSbpwqhPKh40FyoCICtSvBBR6aJ+fHOO9qk+G4qXl8Wjvo8YNpKEuamuO/PqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ILlfmHQT;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B0F606A31A
	for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 17:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B0F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=ILlfmHQT
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-81b54d0cb17so1245409a34.1
        for <sashiko@lists.linux.dev>; Mon, 19 Oct 2026 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792432411; x=1793037211; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U026smUJcD1WeuJ4KQ86+20/5ae5gjgHhLL6yY5chg8=;
        b=ILlfmHQT9hoLXHWrDkitMAJu0ZxPs/pgT+WASEi443FUQHZK6CRhxB6OTBPWUuZ/xX
         P3QDell5DOc9jyNkaw+0BuA0rMzqATdPZyh6T3riU5fRxywx2NLr5BpQLEGcUmWIJ2fH
         0o51yW4nyZxesCWPukaZZYv7MRnrFmt70pIhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792432411; x=1793037211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U026smUJcD1WeuJ4KQ86+20/5ae5gjgHhLL6yY5chg8=;
        b=pCRziAsWt0OrLVXtD/tDJ0CR7nKDVO92WAUvScZ7nRRUNoEqUH69bRVZju5VMHxmtd
         rZau743olHYkn82evhXDyffgNP7nCAq3sFdteRalIrByfkDJrF0WdH4P/w5GuYYZCdoD
         WRASAYmsh5JT9sO5MZTfZOMNISatlyJ8xXBKQsjmZS8NoxwzOWSaca89PRPebc5hlT3K
         qvLTjlVsIhu2bmcd3XDx3/zSAoH2cuitu1qDY9mLMx68uR+XOK8KDgIFkIsNcDJH7wkd
         g7mh6xpjYIo+6yaTLM1pU7CvusDwj5lyQHwTs22zhvZsHiwPdlJnyqslDrAqk5Z+2r1f
         nvSA==
X-Gm-Message-State: AFq9FYJYFeFUXs8kpgz2jYc+an3aNjABgDm0NKocZ4bGiFb+Q+k4BcZk
	ztShxmu3xgnFiftVvTjVmPwkdzXHP54uxvieH76YIjMRTU+i3M5txig+igSQBnoyzgk=
X-Gm-Gg: AYBFou0cJdWJBxsrrVitWmPinRgb25r5Rr3MjL6d+Bhv20O2v762qDCsxBTWZryJbgQ
	AiOKoRAwvpvjCKsqBHkOAPQgtRn0qAMezXQadHClVd8Lk/dIfLJAhPcxSoMAH//x/03P3jSEMKk
	qyoeNZcTwVNWkCcxLIbZ22+Ijdd4XtEV6Wssk658autC7nA3/+sAcYdwlQndFloMebHw9T1zpMZ
	gSUgZ3MhrPUhlQlxpEuTGPN/uo55EvGc1GB+bKQalfurXy6x2uczmk/Qasc0eqtC3CskQ+sZxgd
	o6wTouDC+WdaMNmU1/G865yikCeJ1ILW26r4Jk1VbC5AR+7n/J+7zTwEOZr5CVQeotZCeMxAbw5
	IYXsy9EOCtFphCS3A/BtOTgAKJdPjS0T+4SmR8jrMaHRL6eFhiMHOXQkuyOiTMgcoMq5SUUi/qK
	t1wViJfFQ5A0GzFyMtTHmW68nVGl764z+YSE86RVAhILgStr4bS0kr056By9P+IQ+bYkzNQvxfd
	XczlUtP
X-Received: by 2002:a05:6808:1488:b0:4cb:f21b:6f8e with SMTP id 5614622812f47-53ccfcb392dmr6817620b6e.33.1792432410802;
        Mon, 19 Oct 2026 10:53:30 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-54b5b40a06fsm879544b6e.10.2026.10.19.10.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 10:53:29 -0700 (PDT)
Message-ID: <a6670d97-bf2f-4027-95a8-c091144725c1@linuxfoundation.org>
Date: Mon, 19 Oct 2026 11:53:27 -0600
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patch pre-submission to Sashiko
To: Krzysztof Kozlowski <krzk@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 ksummit@lists.linux.dev
Cc: sashiko@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <350c7564-a833-4dd4-abf3-b8488280b0fa@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <350c7564-a833-4dd4-abf3-b8488280b0fa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 00:25, Krzysztof Kozlowski wrote:
> On 17/10/2026 19:28, Jiri Kosina wrote:
>>
>> [ in the spirit of the concluding discussion at this year's maintainers
>>    summit,  I'm using this list outside of actual maintainer summit
>>    planning :) ]
>>
>> I have just received a v1 to v11 patchset submission within roughly one
>> day timeframe.
>>
>> Neither myself nor anyone else did comment with any review feedback,
>> except for Sashiko. Which I believe is what triggered all the immediate
>> resubmissions.
>>
>> I don't think this is sustanable.
> 
> I think it might be fine to drop usual expectation of one patchset per
> 24h as long as maintainers can completely ignore patchsets with Sashiko
> replies.
> 
> If people want to keep bouncing the ball between them and Sashiko, they
> should be allowed and then we should be allowed just to silence that
> email thread completely.
> 
>>
>> The idea of throttling Sashiko's responses was gently nibbled at the
>> summit, and might be one of the options how to deal with this.
>>
>> Another option I'd like to propose would be to introduce a way for
>> submitters to run patches through back-and-forth with Sashiko even before
>> properly submitting the Sashiko-polished v1 to maintainers and
>> mailinglists.
> 
> I assume you mean they will be running it through Sashiko
> infrastructure, so using sponsored tokens. Otherwise that possibility is
> already there - you can run Sashiko, just a matter of money.

When a submitter uses LLMs to generate a patch, it is reasonable for
maintainers and reviewers to ask them to use shashiko to find problems
before sending it to us. Asking for a shashkiko run before submitting
patches could become part of the patch submitting process.

How about updating the submitting patches document to add a section on
this with instructions on how to run it?

This shifts the responsibility to run shashiko to people using LLMs.

thanks,
-- Shuah

