Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2913E7169
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777058508; cv=none; b=aN1AxhVOu1HKn4EjNipcqw6vlwtYSn2M0AstS6BocgmgXIZH1LrrLfQ8WF65ufh8orbTCgE5RAIeX34gI50fawXzu8p8nT0yBZ1d1eLTPfdbzD5Wj83vBpTQYW6qkL7fksyO5h5oT3gjMxIaNOL7FLMYeTO00s1J2/oTJErUiSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777058508; c=relaxed/simple;
	bh=+vPpUWsYwpvZDuiQ+l6q7qOqmkavzTvyl/AbD1vaAoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n55ALOKQdl8IJvtZWXWV2mcSw6uL7j+eWVdJFjv7iZ70Bry2dUdWCwyBO5psg39/XR0HKSfau+g3hjluc7fHXiUd6cpTF+3AbmVQ01C6nxYB8td0b8B8l29DcUoduiHGY1++pkdKeDSRIgsXVtK8XSBtTNVEoRwoiC9kIsCfD+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dmy28EE7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dmy28EE7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f943870baso3367219b3a.1
        for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 12:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777058505; x=1777663305; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QjJdUnid8SU6MMGKvZIycfLCz20mR4Vbg4ZJjRQz0no=;
        b=Dmy28EE7XUCDyblNpLZMy8rVGpF4cusJjaEGNMJUgJqijkZOGINWSIwGIg0EQucRpw
         NdKZHjzpA16TCQLOotf/zAYO0BYWKN2T9JvTvgBPolVw3JlriI2FPgCEgfjf283+18wD
         Ds6nHBG7ioxEGzYoqwKsmMwSX3GMQs1Rr9YBOoMZfwDJwfyyGFFzc28s+dDIncXXGlG5
         QwPVb23LznSTb9jh0PgSpZD4tLeYlVkRvDDfJsbofsRP39a7wBNHQuC1Myj6yi4poHvB
         BzJ9GT2LzldC9P6NERyINQgM0HycC4NOXizOvAnfFbdJhWMa+YU+d0t2f+HXXzQ4AfUy
         VRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777058505; x=1777663305;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QjJdUnid8SU6MMGKvZIycfLCz20mR4Vbg4ZJjRQz0no=;
        b=ppfTDDhwJ/Av+RyrhKxYt9sEa3EEldWv2wBwRuF8le00dU6FzNormgk/KWot4Qq4IO
         urI2qXMdEkRv6/rSke6hIPT0qX60TdInWZE24lA2V4lVsOl5MucnyAnZeSpwT0BQmMmm
         8/fjxrSoxSGcbXrobmM3tsg7Lh44YFcmAug6qfUfbdPgOaK88SVJAGMkPEk6Cfc5C+mG
         23CKdYKZjkVoQZkMnemjnNi6qyNO0n8+fHyNuZfaX7VEjf+fEMeV3Rwi50UCU+El+WhI
         FQZs0h5O1QqXBQXeJ0KLcSpqnxmhO0IIWjXLa8DHZOM4MLPNeTm1+nh6+Sh4H9zMhcSG
         HwZg==
X-Gm-Message-State: AOJu0YwYQkOAT576z5b5urBAVCy+QGtVtkSQ/RNGEb79pjgzCvFxSZYA
	Zgfuh7kB+ANWglcMidd8Ks8Igei2thJ2wy3sFWaPOwzwFauCxOuZgQUFH+QYGFginKQi4Q==
X-Gm-Gg: AeBDievVeIvJIwywDhh2ib4aV9PcC8cZKiPrOCKg4fT5ud0JFLDuMRS3LbgT2Obn1rW
	+htWtcC52i02rycZj4/KwhPFiRvYreQEh0OaYQQB9ROvCfl4m5EyeHSqZ7FkqTnANHsziAOYBV8
	1mbZnBNDqT3Dznehn183b+00G+99qYq2II9k35YBnWlRz+m8PZTgD8rDjXOeGRXBkPK/juHd1CH
	vlNIaDTMCeb+1TMJ9wSubFHc838wAX5wiyALFQe+3l4ZoRj0UL0ZugRreLENVU+uh+SE7lAmk+p
	WCOBt1MbhlfxeEzk3faJYwpWquqgUnVFN7fTABkHA8thJ+QpwYMDWZvO6h2ri3a5/moLi36a942
	Q9kGtMK3i1wZRxHLHUTZrPqnNUBOkef5FKwuuwn3+pTkSEiCPD0Tp8hnK1WRJBEM8vspscIZlQO
	sxNOKt7i3Enn7CRSasm0HqBcoNE/cZps2laA6RXWvV6nAj48omUdCAejX3iQMGsg==
X-Received: by 2002:a05:6a00:bc90:b0:82f:1e5d:db62 with SMTP id d2e1a72fcca58-82f8c885af2mr35569108b3a.12.1777058505272;
        Fri, 24 Apr 2026 12:21:45 -0700 (PDT)
Received: from Air.local ([198.176.50.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819fesm24451492b3a.4.2026.04.24.12.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 12:21:44 -0700 (PDT)
Date: Sat, 25 Apr 2026 03:21:39 +0800
From: Weiming Shi <bestswngs@gmail.com>
To: sashiko@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf] bpf, sockmap: Fix wrong rsge offset in
 bpf_msg_push_data()
Message-ID: <aevCw8YFsFdjyjRh@Air.local>
References: <20260423155807.1245644-2-bestswngs@gmail.com>
 <20260424155913.A19FDC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424155913.A19FDC19425@smtp.kernel.org>

On 26-04-24 15:59, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 4 potential issue(s):
> - [Critical] When appending data to a full or nearly full sk_msg, bpf_msg_push_data() reads the length of the wrong scatterlist element, leading to a buffer overflow or ring corruption.
> - [Critical] Missing bounds check on the 'len' parameter causes an integer overflow and a massive Out-Of-Bounds write.
> - [Critical] Scatterlist shifts fail to update the msg->sg.copy bitmap, allowing unauthorized modification of shared pages.
> - [High] Uninitialized kernel memory allocation in bpf_msg_push_data() leads to an Information Leak.
> --
> 
> commit 15a0d48ce1bdcc5941167a3e0c2a258bb5038277
> Author: Weiming Shi <bestswngs@gmail.com>
> 
> bpf, sockmap: Fix wrong rsge offset in bpf_msg_push_data()
> 
> When bpf_msg_push_data() splits a scatterlist element into head and
> tail, the tail's page offset is advanced by start instead of
> start - offset. This overshoot points to the wrong location within
> the page or beyond its boundary.
> 
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index 5fa9189eb772b2..a7a9ea4cb2f9a4 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> > @@ -2860,7 +2860,7 @@ BPF_CALL_4(bpf_msg_push_data, struct sk_msg *, msg, u32, start,
> >  
> >  		psge->length = start - offset;
> >  		rsge.length -= psge->length;
> > -		rsge.offset += start;
> > +		rsge.offset += start - offset;
> >  
> >  		sk_msg_iter_var_next(i);
> >  		sg_unmark_end(psge);
> 
> This isn't a bug introduced by this patch, but looking at the earlier part
> of bpf_msg_push_data(), is the len parameter bounds-checked?
> 
> net/core/filter.c:bpf_msg_push_data() {
> ...
> 	if (!space || (space == 1 && start != offset))
> 		copy = msg->sg.data[i].length;
> 
> 	page = alloc_pages(__GFP_NOWARN | GFP_ATOMIC | __GFP_COMP,
> 			   get_order(copy + len));
> ...
> 		if (back) {
> 			from += front;
> 			to = raw + front + len;
> 
> 			memcpy(to, from, back);
> 		}
> ...
> }
> 
> If a large value is provided for len (e.g., 0xFFFFFFFF), could copy + len
> overflow 32-bit arithmetic, resulting in a very small allocation?
> 
> Later, when calculating to = raw + front + len, does the zero-extended len
> advance the destination pointer out-of-bounds, causing a massive memory
> corruption during memcpy()?
> 
> Additionally, bpf_msg_push_data() uses alloc_pages() without the
> __GFP_ZERO flag. After copying the split element's front and back parts,
> do the middle len bytes remain uninitialized?
> 
> Could this allow uninitialized kernel heap data to be added to the sk_msg
> and leaked over the network when the message is transmitted?
> 
> Also, when appending data (start == msg->sg.size), the search loop terminates
> with i == msg->sg.end. If space <= 1, the code executes
> copy = msg->sg.data[i].length.
> 
> Does this read from an unused slot?
> 
> If the slot has a garbage length from a previous pop or shift, could copy
> take that value, causing alloc_pages() to allocate a smaller size and
> leading to a kernel heap buffer overflow during the subsequent
> memcpy(raw, from, front)?
> 
> And if the garbage length is 0, could it skip the if (copy) block and
> increment msg->sg.end without space, corrupting the scatterlist ring array?
> 
> Finally, when scatterlist elements are shifted in bpf_msg_pop_data():
> 
> net/core/filter.c:sk_msg_shift_left() {
> ...
> 	do {
> 		prev = i;
> 		sk_msg_iter_var_next(i);
> 		msg->sg.data[prev] = msg->sg.data[i];
> 	} while (i != msg->sg.end);
> ...
> }
> 
> Should the msg->sg.copy bitmap also be shifted?
> 
> If a shared page (where the copy bit is 1) is shifted into a slot where
> the bit is 0, will it be falsely identified as a private page?
> 
> Could a subsequent bpf_msg_pull_data() then pass the
> !test_bit(i, msg->sg.copy) check and return a direct writable pointer to
> the shared page, enabling unauthorized modification of read-only memory?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260423155807.1245644-2-bestswngs@gmail.com?part=1

We verified the findings locally with QEMU. Two of the four issues are
confirmed with reproducers:

- copy + len integer overflow leading to heap buffer overflow [1]
- uninitialized memory leak via alloc_pages without __GFP_ZERO [2]

Patches sent for both.
[1] https://lore.kernel.org/all/20260424191602.1522411-3-bestswngs@gmail.com/
[2] https://lore.kernel.org/all/20260424190310.1520555-2-bestswngs@gmail.com/

