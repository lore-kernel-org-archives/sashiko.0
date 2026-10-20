Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529016;
	b=mqPPnWabgp5JRroP6e5S/45elO5OjrH+/w44FI0E1hODUGybyY/YFGNT8yhPeBPgeQcs
	 5MNqszYfAksBT/qRecTq7b8OS51P4QnbDoIU2CT6W+aM/CCzQHbWOhJ/0CW9A7NrG1RTV
	 PbWIykDkQb9XqrCXXFZ/bNT+m0d+JB6U6iPqzlSM+O4BpwEAfvjDYgwd/htQhYWzUxb7D
	 Dj8opcsak4oqNbf83yJ8cmlRzERBshHEDgEaI9nWe+8xBipJ8IpeBqJKoA9vn8+kk2Vc/
	 Cr7Yy7sMWn60soLoIc99XV3jBPmWfOI/3DXzMYWZYk0Ral3DRXH3SngFeah5M7sjSzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fh8Izvo8HR5nWpuuB+fxprO8/K5MBx7ONvjX46QoqW8=;
	b=sNpyahUSLKb9U1xnSQ9Rx98/rKWm1Zsbz2HymcIpQK74PArNIHMPHsU3JBAE/Kz6GWrg
	 kn9KxDPjXI07+XJyjSq/liaLHS+bWb+YTN/zEe+XuSteKMc5U3mWfvEWX6veVtrhoayj2
	 rK+Bm4fzT7WS4iQCE054QPZ6VaUPA2mW3HrvuuXy3xZlU3cI6ARS0+zBDxEtU2x/FbYu1
	 CviKqi0KftkvhHVeJSCfqBPzTsDPwx3c6UvcHjL7gL+94o7khsez4XdT0NF9kQSDWA/1A
	 YOdAIxAsBwVzBwDdmg3xSGwIm2oe4DuEgARKk8IkQEaLACelYMUVQ+KJvlyssxUjwWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=TfgN8R0+;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FD5606A31B
	for <sashiko@lists.linux.dev>; Tue, 20 Oct 2026 20:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08FD5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=TfgN8R0+
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f84a55e31aso33749a34.2
        for <sashiko@lists.linux.dev>; Tue, 20 Oct 2026 13:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792529014; x=1793133814; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fh8Izvo8HR5nWpuuB+fxprO8/K5MBx7ONvjX46QoqW8=;
        b=TfgN8R0+2lUmPST07DXIgFEeYIPki+8Vfp7BkpoK1Pq8wKxsBmR8kZK8Vw1oAz+X9l
         5pQolVAhr4tmpgQkif3FnfSYT/TKfELs+cnC6O7Dd7P7gjaXmvmb5VoMvgw0NFFJFhsC
         3PfqGSXtw7i/aqrnnRkYL7yR5FhF/OiLuMSnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529014; x=1793133814;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fh8Izvo8HR5nWpuuB+fxprO8/K5MBx7ONvjX46QoqW8=;
        b=KJeuBZRo6p1Zpzh1diAMjUClnSUkei9tl44nzbuioGFR9tiY559q94I57zx2fWg9ji
         2BMCIbineWe+Ahpu/WwBLccUee6DRGK91MM8eVmVTbyrW5F0kKvrlUlnbMnTZCUPGb61
         mX843n6nVEWfbd7EXKMDTvnoc4sQHdSHC+UpLXuA6AiFJtm3Ap0Gq+9N3zpegGNW343n
         3O8JvfgGZIfqEJ0Z0+FsA7bOFV5KDhWZ0bKd9M0Rb1z1sW2HMO+goC6eqYbIcczMbZ2/
         YZVe/ShnSvcfujd0P4zc4Nm2mX4bgbeR+zVzukGOD5y+RCMJcS40eIzZ1Fsy6GplPnn/
         QSZA==
X-Forwarded-Encrypted: i=1; AKwUvBwDfy0R1ZzxXhr3wkMjdYNm5SI0fhEf4zJhLVEjAW62SsVCBalCepjE2hvATB0WYtc98ZgkwzUb@lists.linux.dev
X-Gm-Message-State: AFq9FYJNm+jYPmthQcHOpBBSiWKbD+JopZwnpSv3P4YlBxdR1gnPjCCq
	KOAJ9yuLvkJDWkovbDyS+c0o7sgWH7z+SEA0njJExZsHYe17IQowez66U+zkzhBcnMU=
X-Gm-Gg: AYBFou3C/+34tdbr3AUyEJMi0OFhXb8i03FwKs6C/GiLV2JXJj49hMYewiDCkUUkk8z
	mRhv2ag5wlNF+la5tPdVebKT39FpOPjMKx8xL6vvyxR752YAqp0inZiX5kkd1S0bJSFfXdWgFp8
	9yT5qofQNuphkd1JPreUXz1o1NoUUGgZVLnfKyNRqGxnHVPnLvobcUqEaJiuwO+cFxgyZEw0FJr
	A81PhPs47HV6wCuR1A/+h4dFGB0YXDFzq85VCnnykZqeEWLCKZlMj8IFaWlMCbn3P/BBL65Pv5u
	u0ogmz93IEhjO73Xo5J9BeN/Om7spWQvH/LT325ksSTBZp2XgNwWEkOk6wBVe/0MisHcMUGvbrr
	kNEPz7GOT8KaiwmiNbwGr9IXQ69u05Bil9QMvSxNWQ8kQk4n6RExr3mnDtetOsZDVUNEORmyjCX
	DeV41FRppjLu4FE2wV8my4lDVpCHpnJQFYKyfjhxKaEjhLp8EdNhvOz4CBQwFJZKNnV4mKLpqq1
	t3OnIHkd/rT4LlUPQY=
X-Received: by 2002:a05:6820:1c89:b0:705:e5c5:ace6 with SMTP id 006d021491bc7-7093fbb4316mr46941eaf.25.1792529013783;
        Tue, 20 Oct 2026 13:43:33 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70902ec488fsm506429eaf.5.2026.10.20.13.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 13:43:31 -0700 (PDT)
Message-ID: <7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org>
Date: Tue, 20 Oct 2026 14:43:27 -0600
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
To: Theodore Tso <tytso@mit.edu>, Bart Van Assche <bvanassche@acm.org>
Cc: johannes.goede@oss.qualcomm.com, Jiri Kosina <jikos@kernel.org>,
 ksummit@lists.linux.dev, sashiko@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <nn69829p-nn62-ppn7-968q-64o246ss90or@xreary.bet>
 <atO3pCuUxI950ftN@mit.edu>
 <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
 <atZ4J86j7CXF82HX@mit.edu> <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
 <ate8oESqneK-3sQJ@mit.edu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ate8oESqneK-3sQJ@mit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 13:21, Theodore Tso wrote:
> On Tue, Oct 20, 2026 at 07:20:53AM -0500, Bart Van Assche wrote:
>>
>> Does the requirement to run a local LLM raise the barrier to start with
>> kernel coding?
> 
> What I was proposing was an expectation that *if* you are using an LLM
> to do kernel coding, best practices would include requiring the LLM
> performing the agentic coding loop to do the following:
> 
>     * Validate the commit using checkpatch
>     * Do a test compile
>     * Run any relevant kunit or kselftests
>     * Run the commit via an Agentic review system

A couple of more:

Explain how the problem was found
Explain why the change is needed

> 
> and maybe even:
> 
>     * Add a kunit test covering any changes made by the agentically
>       generated code.

kunit or kselftest covering any changes made by the agentically
generated code

> 
> If someone wants to send a 100% human-crafted code, today we strongly
> suggest (but don't absolutely require) that people at least run
> checkpatch, and to read, mark, learn, and inwardly digest (with
> apologies to Thomas Cranmer) the rules in SubmittingPatches.  I've in
> the past requested that people at *least* run "kvm-xfstests smoke",
> but that hasn't been particularly successful.  Should we ask that
> human code contributors do more, such as running kunit tests?
> Perhaps.

I think it makes perfect sense to ask people to run tests. How else
would they know their fix/change works and doesn't introduce
regressions?

> 
> Given that code contributors vastly outnumber maintainers and
> reviewerrs, it seems that anything we can do to request that people
> generating load on the maintainers and reviewers take at least some
> steps to make our lives easier.

Contributors vastly outnumber maintainers and reviewers and this
is why it is important for us to ask contributors to do their
part in verify their contributions.

thanks,
-- Shuah

