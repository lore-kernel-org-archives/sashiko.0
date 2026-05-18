Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4681A3043BE;
	Mon, 18 May 2026 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091941; cv=none; b=e/Ge98pOnn7FEn81kFJwI3LxNDDXxQAm16wlYwCtEypqc3J7f0qBzPIJnjXvaOtqDaRRDYZCmnXuE372wc1yiIJjaKEOcZj91iUbtuRw0co/Lh3bIJqyYHoHbxl/+qD+W6Yl9coF8hIx7emrZtncPtFBYQiGkQjVHomIlCVdLLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091941; c=relaxed/simple;
	bh=o4jxgzNs5bOZxSNNfPfJHCCzqAcCx9wktE71rzKkbIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/JvP+z3KTTj5Ha1HwmCEz+IVdhtbdfR8SiTsB4uqmZ6FtMm5Ob/bqUu6iLKIQr4Y/02vdWXnKzRv30iY4oE1CFwWyVH6rbQ49vAMsOhB1KiOTW35GRXj4apTRxxc4NBOPLt1YuY84UDN6Kw0ebK2kwXrlY36/Xi3gfGADuvjjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKhBKul4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKhBKul4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DFDC2BCB7;
	Mon, 18 May 2026 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091941;
	bh=o4jxgzNs5bOZxSNNfPfJHCCzqAcCx9wktE71rzKkbIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fKhBKul4pi752/HxGru+0o87Ya5NYHTpeQDmZl5zLbTyCAYlI57wIRzuaBzCY/mho
	 XEoV9TL3q3oouTzCE1mmpXKKjm65nh9tE8KAdgQAd8bMPVJrV3F/P8FuAngdLGluJM
	 PdoT00Tc6Bw2Pyf+o+kmNhiFyV0hbU3mBmMzxAEv5ZUNLAIJeD6QUkSq98HSXG2wDH
	 KwHb8hed7e2lAIpTKUQ27Vaxe4Imm+W1uoCEbuqACp3K5/gwMTZBBtr0ZOpSr/bHhL
	 7t4oxu/T4XOiughWj2M7U/KP1L8Pdn9ZdXH+jm4j6kIBy38IY+VKWJvZOV9HXbR+6f
	 4E85qbgsKXyng==
Message-ID: <3267e320-99e9-4858-a292-7271abd5b14c@kernel.org>
Date: Mon, 18 May 2026 10:12:16 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stop false review statements
To: Jani Nikula <jani.nikula@intel.com>,
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: debarbos@redhat.com, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <mricon@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
 <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
 <2e20badf27b6910d619329841e37d2961556056f@intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <2e20badf27b6910d619329841e37d2961556056f@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/05/2026 10:04, Jani Nikula wrote:
> On Sat, 16 May 2026, Roman Gushchin <roman.gushchin@linux.dev> wrote:
>>> On May 16, 2026, at 2:33 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> I find it opposite: clogging commits with useless information, because
>>> some arbitrary and completely closed-source tool did analysis means
>>> nothing to me one year later when I look at the commit in the Git history.
>>
>> This is simple not true: Sashiko is fully open-source, under Apache 2.0 license
>> and the code belongs to LF. Yes, the instance behind sashiko.dev is using
>> Gemini 3.1 Pro LLM, which is not open-source, but it’s not a fundamental limitation - 
>> Sashiko is supporting various LLMs, including open models - it’s just a practical
>> choice: to my knowledge the quality of open models is not on par with frontier closed
>> models and it would require a non-trivial amount of hardware and infrastructure to run
>> an open model at the required scale.
> 
> In the context of the "Reviewed-by: Sashiko" discussion, this actually
> makes it really hard to assess the quality of those reviews. It is
> *currently* using a boatload of tokens with a specific LLM, and I find
> it's often asking pretty good questions.
> 
> People build their reviewer track record and gain trust over time, but
> the reviews from what is portrayed as "Sashiko" heavily depend on the
> models and resources spent in the background. As a maintainer, it's far
> easier (though still laborous) to deal with the negative feedback from
> LLMs than the positive, because you won't really know how rigorous the
> review was when the response is just "LGTM".

And this already happened with reviewed-by statement given to one-liner
patch which still was not good enough for the maintainer:
https://lore.kernel.org/all/ce11a8ba-8ebc-4c09-b6d0-7e98febeae6b@roeck-us.net/

Obviously same applies to humans - they also give Rb which misses some
aspects - but I hope a person would not review such one-liner. Sashiko
did and as well can provide such "review tags" for every little patch,
which is not helping us really.

Best regards,
Krzysztof
