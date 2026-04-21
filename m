Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B676FC5
	for <sashiko@lists.linux.dev>; Tue, 21 Apr 2026 00:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776732444; cv=none; b=QKcc0DxhNexlmRFAuEjbOgvSMRyjPPR9ZbQHfvAIO7V/E3u20cF1aHgWOk8kM3FISvpem/AcyNmLZvHtyMATmwgrc3j+mLhRnZ7CXflKJM+ft9NiiQPVsOYrMBcw6yW24tN1IzmbbV/wDReU+8oj66mEr2JD02/8I+b7YyO5RCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776732444; c=relaxed/simple;
	bh=f1a2hvGWC9ppM0mCrlz6TeECsoZUfQy9vgXC2YKYcXA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=VoSmumLJw1v35fGL5JkKQv6u6KuR7kQrpCQ7M0d609cfY8Dz39xlsH9r6ez0XtPU/g7WVfxX2hFw+pHg3TUDFJwHYhT0WxODcuwkucd68i4wGxB8TgpQMl+u+4hIosmukkhF73MveUcHleS8kIhYLORVkcYBD/4XvDpYwQ5xHF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxNegXyeZpck8CAA--.2783S3;
	Tue, 21 Apr 2026 08:47:19 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxSeAVyeZpvJ1xAA--.19499S3;
	Tue, 21 Apr 2026 08:47:17 +0800 (CST)
Subject: Re: [PATCH RFC bpf-next 2/2] selftests/bpf: Add LoongArch support for
 get_preempt_count()
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260420111516.19982-3-yangtiezhu@loongson.cn>
 <20260420133532.4973DC2BCB4@smtp.kernel.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <800726d7-7f09-40ee-a3ae-faf879364bdf@loongson.cn>
Date: Tue, 21 Apr 2026 08:47:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260420133532.4973DC2BCB4@smtp.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxSeAVyeZpvJ1xAA--.19499S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur1UGrWDur1xGrWUWFW3urX_yoW8ur47pF
	yfCayqyr48Jay2gw17Jws5uF1ftw1kWa95Gr95K3y2kw15trWrWrWxWrWayw13Z34Fgr40
	v3s2gw4avF4DAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25EfUUUU
	U

On 2026/4/20 下午9:35, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [High] BPF programs including `bpf_experimental.h` will fail to compile on LoongArch due to a non-existent `thread_info` field in `struct task_struct`.
> --
> 
> commit 82453686fe5eacd9f219e2a050dc016b297cfc79
> Author: Tiezhu Yang <yangtiezhu@loongson.cn>
> 
> selftests/bpf: Add LoongArch support for get_preempt_count()
> 
> This commit adds LoongArch support for get_preempt_count() in the BPF
> experimental helpers. It enables bpf_in_interrupt() and related macros to
> work properly on LoongArch systems.
> 
>> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
>> index e5c039bc44cb4..5847bbf12d240 100644
>> --- a/tools/testing/selftests/bpf/bpf_experimental.h
>> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
>> @@ -507,6 +507,8 @@ static inline int get_preempt_count(void)
>>   	return bpf_get_lowcore()->preempt_count;
>>   #elif defined(bpf_target_riscv)
>>   	return bpf_get_current_task_btf()->thread_info.preempt_count;
>> +#elif defined(bpf_target_loongarch)
>> +	return bpf_get_current_task_btf()->thread_info.preempt_count;
> 
> Will this compile successfully on LoongArch?
> 
> Since LoongArch does not select CONFIG_THREAD_INFO_IN_TASK, struct
> thread_info is allocated on the kernel stack rather than being embedded
> within struct task_struct. Because of this, the generated BTF and vmlinux.h
> for LoongArch will not contain a thread_info field in task_struct.
> 
> Could this lead to a compiler error indicating that there is no member named
> thread_info in struct task_struct when building BPF selftests?

As mentioned in the cover letter, it needs to apply the kernel patch
"LoongArch: Implement CONFIG_THREAD_INFO_IN_TASK" [1] before testing.

[1] 
https://lore.kernel.org/loongarch/20260420102907.4617-1-yangtiezhu@loongson.cn/

Thanks,
Tiezhu

