Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92A401494
	for <sashiko@lists.linux.dev>; Mon, 11 May 2026 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514718; cv=none; b=UWRCyy52DLVg5IN/3Kgt9BkwzWnZ8Pn7CTRAWpxjivim1OrFPyT9KbcL8TD0KYVhpBP76m7ufbj368iomSw6z8LmokghhqtlL1kryPNE3Hok7ZWS0Fk1ytGdPSsv8+y3ombxzmMUehxRIkmax3kCD3Pb569Ak8/GTP5kqOoQtpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514718; c=relaxed/simple;
	bh=bPCZegAxHoeoycJru1ZuXUkag0ytA9Cy5ZI2BD2RvCY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uOKHBBn/cFK34Frt+hU1KWKs9u0BC2L07WWUQQldB2vglfJlFV549muCefHAHc/5S37YJnIXU2knuVQUuUvW1E5wwflvpPjN6pSK4V/+5ZV+wiBi/F/TJt6bGDUNyp/PdmsPnKW6EQO4CRj5dKfrnNCDuwl2qQ7OHbNI1coZtyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2iFf9DO; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2iFf9DO"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7de431da8fbso3648508a34.1
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778514715; x=1779119515; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8ymRLx5DRViBt7vQ33aUn3ouAwAfSpy9qoKhGae7+s=;
        b=a2iFf9DOfxjS2ttz4N1TkA3X9CL6iCL3dimal72KNtt1v1dlyUzKGUb1/sVU104V5u
         PjlD18yeaEJwBnrW9a1i4VK6p/cna6rHNL3UO+SPPmV7LWMF2umm9YDQerDm0SbGK9dp
         ULs7eeGrvsbuVfgvPf82pfAH4hxPQDkaDc1mgElFqj5c2aZO3m+JKT0OEfPg6bS+Z6PQ
         Jbyd1m0UFJqGLTunYSgZyWY7A6Yw+2asRUSGJZMR3+gEkoeMVPHBUj6JsviX/bvuX4F/
         J7mDta3AjinrD8yrm9sMqN8tQaWqyfLLVFj4NyWCkmSr1+7y1hAto5N2H3phDFBsiAmN
         BVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514715; x=1779119515;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8ymRLx5DRViBt7vQ33aUn3ouAwAfSpy9qoKhGae7+s=;
        b=JFgf+BrMXeOIMeX3eYQEZrg0w4YKey2eAQsuC/6YnpZdW3TORgeATVIQEBR3gRctEC
         BjWR1nSX8uDV+Bzzh77PkBg//FuZzeqDWYXtFpOBP9jS5Dz+r/yrbV7eJ9BXcdiEP3P6
         5EhQjz/guExtoTfdKC+Sq/7E0np3FpTSIglwqPp9wu2BVZbWYgqseod2dawtS6BVvoam
         l8HKIFt4thctmWjpGQLnZiIXrpXE4Xxl9spHjKOC3lCAOVDBtDEP8/Y0FHa3QB9q94XV
         TbixNIRUbpm0B5Y64yJLxyl/H69foYH72IYl9YH008IYfFEdzui+V+NnpHZUnkEuNMak
         AkHA==
X-Gm-Message-State: AOJu0YyLi8imCvgZbJ61vtWjiX5zXjXfdYxJO2RcHdZMkLcF+YxGvFOc
	L2bBcE5Srpn4ApxSfOde1FwWZ74SgX4AhqGNZBu7zrVJ505Y/8O5j1ws2/WzDQ==
X-Gm-Gg: Acq92OE9BKST3sMi5mRAaY8fFRzWX7a0x3vhYXhaE5k4ZZlCTrlU3pFQfvjVInE/eQE
	gqjFBS5KsQPZMRkjwrG0oMPtYf2mlc6D6MsZLkWnA4cPvAGfS288lJ+MSTc7AGeWXWM0PHAIDE4
	TDilyk62GumDujp0OGMvUHeZtl/HOoNn9PdohEp7JMnnMBhRbi8k7ulTny+CCV1MpyOAXP/QYug
	tQUEVllT/uH5sCCkEToD1+jdM66qc8FqDt74Js3+ulvNGfFGvcFHRTx5+IGs/d0YLUzVYcWMJEk
	soFPor5YYzzxsf0I5MWdh56/x2y9PTOeRX+mvQ+Nz0BUnfoBs7M2F6WkN2ePDAzuQ4S9UU09yXL
	BLGgelgxj6+aBDI1ugqWKKzRwLYbnv8Y2WMr8Zuo6G+avtDJ3+DvZd95TbG4hMyTNQMRnPSDAwL
	xD932fegtTqbtNHT90ByFUqa33Df2kABtzIhHRZNqCdbn4UAe2rWf7ORBi5rj8bQD51rkd2mIhu
	mzY6w0xlVRvGRtU+w==
X-Received: by 2002:a05:6830:25d0:b0:7dc:5899:c711 with SMTP id 46e09a7af769-7e381f0fac8mr6693162a34.3.1778514715076;
        Mon, 11 May 2026 08:51:55 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:47::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e367d8fe3esm6861406a34.21.2026.05.11.08.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 08:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 08:51:53 -0700
Message-Id: <DIFYUK5DKGAT.189D9YYSQFCUZ@gmail.com>
Cc: <sashiko@lists.linux.dev>, "bpf" <bpf@vger.kernel.org>
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from
 NMI
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Justin Suess" <utilityemal77@gmail.com>
X-Mailer: aerc
References: <20260507175453.1140400-2-utilityemal77@gmail.com>
 <20260507234520.646C4C2BCB2@smtp.kernel.org> <agCXEJKJh-JGMhjG@zenbox>
 <CAADnVQJdFCFJcg0Pqdnx=D2h5vHj_q4mrwSJYxRC5RW0NTFNvQ@mail.gmail.com>
 <agEnc0aYMhuIeDlq@zenbox>
In-Reply-To: <agEnc0aYMhuIeDlq@zenbox>

On Sun May 10, 2026 at 6:49 PM PDT, Justin Suess wrote:
> On Sun, May 10, 2026 at 03:38:08PM -0700, Alexei Starovoitov wrote:
>> On Sun, May 10, 2026 at 8:14=E2=80=AFAM Justin Suess <utilityemal77@gmai=
l.com> wrote:
>> >
>> >
>> > Any help or guidance on this would be appreciated!
>>=20
>> sorry for the delay. Everyone was at lsfmmbpf for a week+.
>>=20
>
> No worries! I hope it was an enjoyable trip and I look forward to
> hearing about the conference.
>
>> All of the solutions so far are way too complicated.
>> bpf_kptr_xchg() has to remain inlined as single atomic xchg
>> without slowpath otherwise it ruins the concept
>> and makes usage unpredictable.
>>=20
>> Let's step back.
>> What is the issue you're trying to solve?
>>=20
>> the commit log say:
>>=20
>> > A BPF program attached to tp_btf/nmi_handler can delete map entries or
>> > swap out referenced kptrs from NMI context. Today that runs the kptr
>> > destructor inline. Destructors such as bpf_cpumask_release() can take
>> > RCU-related locks, so running them from NMI can deadlock the system.
>>=20
>> and looking at selftest from patch 2 you do:
>>=20
>> old =3D bpf_kptr_xchg(&value->mask, old);
>> if (old)
>>   bpf_cpumask_release(old);
>>=20
>> so?
>> bpf_cpumask_release() is fine to call from any context,
>> because bpf_mem_cache_free_rcu() is safe everywhere including NMI.
>>
>
> My mistake on that. I picked a bad example for the test, but the test is
> just exercising the nmi dtor path, and doesn't rely on the particular
> type of kptr. I just picked one that was easy to acquire a reference to.
>
> This dtor is safe. task_struct dtor, cgroup dtor, crypto_ctx dtor are
> not. I've annotated why here:
>
> crypto_ctx:
>
>   __bpf_kfunc void bpf_crypto_ctx_release(struct bpf_crypto_ctx *ctx)
>   {
>   	if (refcount_dec_and_test(&ctx->usage))
>   		call_rcu(&ctx->rcu, crypto_free_cb); /* UNSAFE: call_rcu */
>   }
>  =20
>   __bpf_kfunc void bpf_crypto_ctx_release_dtor(void *ctx)
>   {
>   	bpf_crypto_ctx_release(ctx);
>   }

bpf_crypto_ctx_release() is only allowed in syscall prog types
and dtor via hashmap free will execute in safe context as well.
So not an issue.

> task_struct:
>
>   __bpf_kfunc void bpf_task_release(struct task_struct *p)
>   {
>   	put_task_struct_rcu_user(p);
>   }
>  =20
>   __bpf_kfunc void bpf_task_release_dtor(void *p)
>   {
>   	put_task_struct_rcu_user(p);
>   }
>
>   void put_task_struct_rcu_user(struct task_struct *task)
>   {
>   	if (refcount_dec_and_test(&task->rcu_users))
>   		call_rcu(&task->rcu, delayed_put_task_struct); /* UNSAFE: call_rcu
>       */
>   }

In theory. I don't think there is a reproducer.

> cgroup_release_dtor is more complex, goes through ultimately through
> callbacks to:
>
>   static void css_release(struct percpu_ref *ref)
>   {
>   	struct cgroup_subsys_state *css =3D
>   		container_of(ref, struct cgroup_subsys_state, refcnt);
>  =20
>   	INIT_WORK(&css->destroy_work, css_release_work_fn);
>   	queue_work(cgroup_release_wq, &css->destroy_work); /* UNSAFE:
>     workqueue */
>   }

similar to task_struct. I don't think it's exploitable.

> More generally, unless it's a BPF allocated object or doesn't rely on
> locking/call_rcu or workqueues, the dtor is unsafe.
>
>> hashtab introduced dtor in bpf_mem_alloc,
>> so bpf_obj_free_fields() and corresponding dtor's of kptr-s
>> are called from valid context.
>>=20
>> What is the problematic sequence?
>
> So from the beginning stepping back.
>
> The problematic sequence:
>
> 1. ref kptr (i.e task_struct, cgroup, crypto_ctx) xchg'd into map.=20
>
> 2. in a tp_btf/nmi_handler (NMI CTX) program we drop the item from the ma=
p
>    with that referenced kptr field.
>
> 3. dtor runs in the nmi context
>
> 4. dtor runs call_rcu/queue_work/some bad thing in nmi, causing deadlock.
>
> You can see this demonstrated in my task_struct reproducer [1].

did you?
That link points to your v2 with cpumask.
I don't recall seeing task_struct repro.

> It causes a deadlock by deliberately releasing the last reference to a
> task_struct via a ref kptr in nmi, getting it to call_rcu and deadlock.
>
> The typical solution to this is to run the nmi unsafe code in non-nmi
> context by offloading to NMI work, as you proposed.
>
> The problem is we need space to for the jobs we enqueue. The required
> information to run the dtor is the dtor function and the original object
> pointer. The number of dtors that can run in a single tp_btf/nmi_handler
> prog is nearly unbounded.
>
> The other problem is even though bpf_mem_alloc is safe in NMI generally,
> we cannot allocate in path that destroys an object. If the allocation
> fails due to memory pressure, we leak the object.
>
> There are a few options, all with drawbacks.
>
> 1. Dynamically allocate the job. Non-starter, failing to allocate is
> unrecoverable, memory pressure means we can't ever schedule the dtor to
> run.
>
> 2. Store job ntrusively in the object : Requires a safe place to place
> it within the object. Bad because not all objects have a space we can wri=
te to.
> Non-starter.
>
> 3. Within the map slot (after actual kptr): Taken with my initial approac=
h in v1.
> Significant complexity and requires per-map changes. Feasible but very
> complex and would need DCAS or locking to make updating the map slot and
> our job information atomic.
>
> 4. Wrapping the kptr in a box and storing it in place of the kptr [2] :
> Proposed by Mykyta. Would break direct load access to kptr objects.
>
> 5. Make every dtor nmi safe individually. This would require a lot of
> duplicated code and require updating every destructor invididually.
> Feasible technically, but seems brittle.
>
> 6. One that would be the least complex, would be forbidding xchg operatio=
ns
> that can run the dtor in NMI context. That would preserve the inlining fi=
x,
> but limit our usage of referenced kptrs in BPF programs that run in NMI c=
ontext.
>
> The approach here:
>
> 7. Allocate a new spot for a free job every time we xchg into the map
> and put it in a global list. When in NMI and we run a dtor, we pop a
> job from that slot and use it to offload our work via irq_work. If
> we're not in NMI we run normally. Downside is this breaks inlining for
> ref kptrs.
>
> ...
>
> I may be missing something critical, but everything I've looked at
> points to this problem being much more complex that it initially seemed.

yes. it is complex. all 7 options are not good.

I recall the whole thing started with desire to add bpf_put_file_dtor().
This was discussed with VFS maintainers and they didn't like the idea,
since it needs a ton of work to make it safe:
. umount notifier to make sure stashed file doesn't hold umount
. potential circular refcnt issue if file to bpf map stashed into the same =
map
. scm_rights-like facility with garbage collection

So generic file stash is really no go.
