Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F283002A9
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 02:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778552020; cv=pass; b=Ub6YxnbaQQnnWqGu55GXy5c8Os442Wk5h7EftpGOBgaPnvMSuARs4+sCEpIbzgPcSKxpo4ag25W5YLJn87cvbA135LRxFzx6vruopgK57eexp8DaxCmsKSBbZQUQeWdnx5Z44XQXVzc6+VlZr+dTN6nP1QG/QjKHYA5Ui3R12E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778552020; c=relaxed/simple;
	bh=P4+Zr1GIkEfutwCczqL5o+kD/OEMgVRPert8Uyv35a0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3GUGHNvafClnlQuNsh21EW2Zi2yvRTubWPgmVZqMF4s8CvGfifXFKtHhoV5nlanD/LmFXbq73j4fpWVUy99jJNESmNuroj0H0aEPm2uRdRmSPM6kWn6lH2hsG1T9Uh9X2Ju6yHyRHgC8YcNiRbI3F4W06ks0KjKD9BBANZ0/kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Quuyajxb; arc=pass smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Quuyajxb"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso45275965e9.3
        for <sashiko@lists.linux.dev>; Mon, 11 May 2026 19:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778552017; cv=none;
        d=google.com; s=arc-20240605;
        b=MF9TLlGMrQXIuCZvfpQZj6Z7BpMVJA0LL0Vatv9cKKAkJsisl5RLjutHgZT2Q65Wwd
         p/1MVbEBHCgLhlPfauGuingShZLIlt/GFX+XK1KE4UtasCq84DwlApfoBjyxPwk1RRZZ
         Qw4T5p5aDbQOXLImCywcXSvvJQkBBKVmTzEfdzEHBLgHgB5S/gNKy/7oficQ01UbXYjQ
         cmV6j2hQHuFHa5mPo3ioNChwcbghA1yt1JV8/pTa7GZSUD//yXaanHUwRbfGjDqdsjwP
         OUgfvR9FO1PmDii1SDJQ2BmlyrVkvLu2zDPD14UdLkDcqGTJfJGdwtHyLi3KCOwYqULw
         ijEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yvmEPWhcfTWxDEchg5ZkewS+3/xfIv7Hmhbhu8n+gyc=;
        fh=a5bAX6l9j47bvk2xTdFSd7rnAE6Qhb8TBBbxEdqoytA=;
        b=OQZwdMh9DIEfhWCyP3483Zku6ZyOYZQ8t1c+7QXygRe5z9t2g4dGSMTfsLb2SIH0Sz
         0n9UTBNojMGyvTh34RPSzvR0nfc16VngwIGuiDDkhGEMJbkbVrguL9KjYSySaslDl1Vk
         +jtnwBjuPZ1LiF1Fwg+ZC9idKnGQ53TqXTMUyvgcnIp0HOm8xL2Q69YzpLuxUr7g/n9e
         lmpLUzu8m0H+YoraiZhFJWKs/6/Y29HVPiBIvXkLhPj/XH6g03RH30Oaep5V4V95QGl7
         FEz9XQmwjn8qvW5gelfKf9tNaOVjp7nQdiLyexhizvOlXxUPjlQKpecd7YaukVgWkuqp
         b1Jg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778552017; x=1779156817; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yvmEPWhcfTWxDEchg5ZkewS+3/xfIv7Hmhbhu8n+gyc=;
        b=Quuyajxbd3997Uhk308Tg3+8lMM5aFKS2/QbpcXEDhmJbi2HYmxBZJ7dIUhZ0vbfY7
         YWj8OL6aXv83BsXGqu8b2kimNJStRNJscAViQg/cc6EaMOZolMIgaZ8+dcHQ/kYFTnfA
         GkaWzsUBEY4kajB3GLm+lm9JYa7D4+aC9kz+LBgzTuiuCfmX+uvlUop3EcYyU4Jbq6yJ
         FEmv61vlLXcQHYjxDnf7whwy0llJ5JtrusF0CRArhohsePANc2lhb8934hC0HcUTrw8E
         KWAW8CI1R+03Y0OYKy0EYopPI1+npVU6IKIYciBiuEw8D1ScHHMN/xBe0kEcQd3lRSnH
         SQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778552017; x=1779156817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvmEPWhcfTWxDEchg5ZkewS+3/xfIv7Hmhbhu8n+gyc=;
        b=dIqfagjInUvSMdsobgU+W3iBe0sfD7AZjBRmX1aMCqhirF/1eEYewhegpqgrPVeSb1
         1BT/eQfgJfgSVcsDoLgWTQFNexL5AIAVaFX2nMpqop8pmaJc+/te6hA19C69P6K9wA7K
         UzWqNSIug5w+w/PWrK6WIjfKDo/eUcUnGOGGMaoLV2IuEmys/L/y8Hu8tLUAkP6UVxZs
         vvuO5+x46+wzk3gs5GES7+PVhAiR+ABBT0JQ98qJLGRxjvKfcf/i0n/5rrrIF+UsJDsz
         XCRXbsJ7pfa6osBMx1jLZvE3igbikEsrU8GlJzGcxkV7ZQ4w3uVQ11JyF/07xOgYj3xD
         PKTg==
X-Forwarded-Encrypted: i=1; AFNElJ9FwOz+bz4eQyJ46kkrVPmrpQXWFnZIydMEsQVscm/5A5eaUkUHbRuyIiPRR7UaDQ8hWzEwpnNG@lists.linux.dev
X-Gm-Message-State: AOJu0YyTxJRzTVroKi/o0i5xv/CxBHryOEDxkzAWxzujq03YaWtgqKwV
	yivgCM5z8C6RcuUZuZtclxnySPqlJhx9ZR25whBzv3lm23caGuP1ONWn7aKxFDmMS+zAcY45eMV
	yFuJ2IRdpWzncTeCm6oUOopksnRMs/go=
X-Gm-Gg: Acq92OGnOtVP7luOwPU0PAf1E9Z9TfhwtqvKDZNe2jRrYlzvTkQqBUVhRFB9KhWGHH6
	bjkCF3pLJ6NsJth/maWKWih0oMQ1TAP8IHNGw+wHzwL/ulM78v8fKa9JGoM/hnCPPCdA5jiimEm
	SCfz3HMqTvuKabVPD6fcDCp2zlrtLsStRA+UWFP9S/Az0DcRp4jHZ0FJoAoNeI9+BuDfzSrK3tc
	o57L5NYvqPqLFH0PokHLnTuYo6zMeHkVviSxB3K/C/Y/sj5CmUha81Jb838vlAm3Lhmxr2WwMV1
	gyRPTcoaL3X7uSHOVYIZ8gAQyuRMdDW7Ghh/jd/P8DyS7+el+XxRzXWIaee3wvrr4VXWq7mWJoW
	q6PPdLf4PNBDHz/wRTZiYlumQa0fo4LhDvTaSkSnHKa2wUEVKdo1kBN3K
X-Received: by 2002:a05:600c:8b08:b0:48a:5501:7995 with SMTP id
 5b1f17b1804b1-48e51f32ca9mr449429875e9.18.1778552017165; Mon, 11 May 2026
 19:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507175453.1140400-2-utilityemal77@gmail.com>
 <20260507234520.646C4C2BCB2@smtp.kernel.org> <agCXEJKJh-JGMhjG@zenbox>
 <CAADnVQJdFCFJcg0Pqdnx=D2h5vHj_q4mrwSJYxRC5RW0NTFNvQ@mail.gmail.com>
 <agEnc0aYMhuIeDlq@zenbox> <DIFYUK5DKGAT.189D9YYSQFCUZ@gmail.com>
 <agH_0MEw4b0pB11-@suesslenovo> <DIG0ONMVOP0L.3QFYUPWFSKWI4@gmail.com>
 <CAP01T75942V+wKJD0yhs8yb7U5vj+y9s6efJ+UdpTMfzP31CWg@mail.gmail.com>
 <agKBE4Ci4_LmJ1Dc@zenbox> <CAP01T76i3S93kvXnQvK+NU1ee82s+ka2jQfmf-yL86r9AS2tuQ@mail.gmail.com>
 <DIGBOYWXZ95S.3GAGVQGUJNQD4@gmail.com> <CAP01T75y1CuPQ9af9SgYqY=c+3q7ZXTKJJu=znAE3HtEEBMwOw@mail.gmail.com>
 <DIGBZVSAOXGC.VA20SWFV4R74@gmail.com>
In-Reply-To: <DIGBZVSAOXGC.VA20SWFV4R74@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 12 May 2026 04:13:00 +0200
X-Gm-Features: AVHnY4K9JXZZiEZVpzNn98npD_32lbPWj41MQ2Ugi4yey-pKI9TCGJcYBQxGMlc
Message-ID: <CAP01T772FHr6q3oD+AyUigdiPhVPdShP5qUyU2qCZrTGU1HZyQ@mail.gmail.com>
Subject: Re: [bpf-next v3 1/2] bpf: Offload kptr destructors that run from NMI
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Justin Suess <utilityemal77@gmail.com>, sashiko@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2026 at 04:10, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon May 11, 2026 at 7:03 PM PDT, Kumar Kartikeya Dwivedi wrote:
> > On Tue, 12 May 2026 at 03:55, Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> >>
> >> On Mon May 11, 2026 at 6:46 PM PDT, Kumar Kartikeya Dwivedi wrote:
> >> > On Tue, 12 May 2026 at 03:43, Justin Suess <utilityemal77@gmail.com> wrote:
> >> >>
> >> >> On Mon, May 11, 2026 at 10:10:07PM +0200, Kumar Kartikeya Dwivedi wrote:
> >> >> > On Mon, 11 May 2026 at 19:29, Alexei Starovoitov
> >> >> > <alexei.starovoitov@gmail.com> wrote:
> >> >> > >
> >> >> > > On Mon May 11, 2026 at 9:38 AM PDT, Justin Suess wrote:
> >> >> > > >   [   21.604660] Call Trace:
> >> >> > > >   [   21.604662]  <TASK>
> >> >> > > >   [   21.604663]  dump_stack_lvl+0x5d/0x80
> >> >> > > >   [   21.604666]  print_usage_bug.part.0+0x22b/0x2c0
> >> >> > > >   [   21.604669]  lock_acquire+0x295/0x2e0
> >> >> > > >   [   21.604671]  ? terminate_walk+0x33/0x160
> >> >> > > >   [   21.604674]  ? __call_rcu_common.constprop.0+0x309/0x730
> >> >> > > >   [   21.604679]  _raw_spin_lock+0x30/0x40
> >> >> > > >   [   21.604680]  ? __call_rcu_common.constprop.0+0x309/0x730
> >> >> > > >   [   21.604682]  __call_rcu_common.constprop.0+0x309/0x730
> >> >> > > >   [   21.604686]  bpf_obj_free_fields+0x118/0x250
> >> >> > > >   [   21.604691]  free_htab_elem+0x85/0xd0
> >> >> > > >   [   21.604694]  htab_map_delete_elem+0x168/0x230
> >> >> > > >   [   21.604698]  bpf_prog_f6a7136050cb5431_clear_task_kptrs_from_nmi+0xeb/0x144
> >> >> > > >   [   21.604700]  bpf_trace_run3+0x126/0x430
> >> >> > >
> >> >> > > that's better.
> >> >> > > Looks like we moved bpf_obj_free_fields() into htab_mem_dtor(),
> >> >> > > but left check_and_free_fields() in free_htab_elem().
> >> >> > >
> >> >> > > I think the fix is to remove check_and_free_fields() from ma path in free_htab_elem()
> >> >> > > and fallback to bpf_mem_alloc at map create time when map has kptrs
> >> >> > > with dtors. Even when BPF_F_NO_PREALLOC is not specified.
> >> >> > >
> >> >> > > Kumar,
> >> >> > >
> >> >> > > thoughts?
> >> >> > >
> >> >> > >
> >> >> >
> >> >> > Yeah, removing it from the path that helpers can invoke seems simpler.
> >> >> > Remember though, this splat is just for hashtab, we have similar
> >> >> > bpf_obj_free_fields() in array map on update. I think fundamentally
> >> >> > the main issue here is that we logically free special fields when a
> >> >> > map value is freed or deleted. When updating array maps we logically
> >> >> > 'free' and then 'update' the same map value together. For hashtab, it
> >> >> > happens on update/delete.
> >> >> >
> >> >> > We could relax this behavior to avoid eagerly freeing these special
> >> >> > fields on update or deletion. The only worry is how this would impact
> >> >> > programs that have come to rely on the existing behavior. There are
> >> >> > patterns where people expect kptr to be NULL on some new map value,
> >> >> > which causes programs to return errors when that expectation is not
> >> >> > met. Just doing the skip when irqs_disabled() doesn't save us from the
> >> >> > surprise side-effect. We need to decide upon this first before
> >> >> > discussing the shape of the solution.
> >> >> >
> >> >> > This is the theoretical concern; In practice, I think most people who
> >> >> > depend on such behavior use kptr in local storage maps (in
> >> >> > schedulers). So it probably won't be a problem in practice, even
> >> >> > though we can't judge this ahead of time. Also, we eagerly reuse map
> >> >> > values when using memalloc, so the guarantees are already pretty weak
> >> >> > I guess.
> >> >> >
> >> >> > So, if we are not going to go through a grace period (like local
> >> >> > storage) and free back to kernel allocator before reuse, we should
> >> >> > relax field freeing behavior. At best, we should cancel work for
> >> >> > timer, wq, task_work, and task_work, leaving other items as-is. E.g.
> >> >> > BPF_UPTR is used in task storage which I think is accessible to
> >> >> > tracing programs, I am not sure how safe unpin_user_page() is when
> >> >> > called from random reentrant contexts. We might have more cases in the
> >> >> > future, we cannot guarantee we can handle everything in NMIs
> >> >> > universally.
> >> >> >
> >> >> > So the best course of action seems to be relaxing
> >> >> > bpf_obj_free_fields() to bpf_obj_cancel_fields() that just does cancel
> >> >> > on async work (timer, wq, task_work) for delete / update and let other
> >> >> > fields be as-is. We likely need to do bpf_obj_free_fields()
> >> >> > additionally before prealloc_destroy() now, but that should be simple.
> >> >> > Whether or not to use bpf_ma when kptrs are used in prealloc map is a
> >> >> > separate change.
> >> >> >
> >> >> > This should hopefully resolve the issue, unless I missed other cases.
> >> >> This does sound good, so you'd set the bpf_obj_free_fields up in the
> >> >> htab allocator dtor for the final free and rely on the allocators
> >> >> existing nmi deferral?
> >> >
> >> > It is already set, except for prealloc maps. But we can call it before
> >> > destroying the pcpu freelist etc.
> >>
> >> htab_map_free->htab_free_prealloced_fields does bpf_obj_free_fields already.
> >> So scratch my suggestion to force bpf_mem_alloc on preallocated hash maps.
> >>
> >> >>
> >> >> The missing piece is whether to handle this differently in NMI or just
> >> >> always do it with the deferral. Also the prealloc question needs
> >> >> answering.
> >> >
> >> > There is no deferral here. I'm saying that we just cancel for timer,
> >> > wq, task work, and leave other fields as is. So we don't have active
> >> > work pending for async items.
> >> >
> >> > So as long as the item keeps getting recycled in the allocator, we
> >> > don't free these fields. Once the memalloc is destroyed, the dtor runs
> >> > in a known safe context where we can assume bpf_obj_free_fields won't
> >> > deadlock or run into any problems.
> >>
> >> So the plan is to do
> >> if (in_nmi()) && case BPF_KPTR* | BPF_LIST_HEAD | BPF_RB_ROOT
> >> just ignore it?
> >> And no other changes anywhere at all?
> >>
> >> That would be too good to be true :)
> >
> > I don't know whether in_nmi() would be sufficient, we likely need
> > irqs_disabled()?
>
> fair irqs_disabled() is safer.
>
> > At that point, why not always ignore it, since
> > freeing the fields is dependent on where you're running. I would still
> > cancel async fields, since they're already any-context safe.
>
> you mean never touch case BPF_KPTR* | BPF_LIST_HEAD | BPF_RB_ROOT
> regardless of running context and rely on final cleanup?
> That's an idea to consider, but I suspect some rbtree, link list
> tests will fail.

Yeah, but we should see which ones do, some of them were written with
expectation to test kernel clean up on map value delete / update etc.,
those don't count as much. Unless this change triggers a real example
in tests, it will likely go unnoticed (famous last words).
