Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690203;
	b=rIEK7Bq/B0rYg067JbHaNMx8l2+TInd33pk7VA0qFJC6PUu6EBtO11Yn51RRGgzETkxK
	 54UV4EfFqSDdHU/TEZDHShCAZkwUTKMqlwDWc1a2TeMTpSYHNqf2NSkKCNUSjnaUCLTMO
	 8yjVqkK4oAsuFuo8jmjaQ0Qxs6BcPzugApr2T2lpHPoa5/2f/GPBqo3gO1FEm9uYRqLBj
	 ECBUsO9gzjZDkbRua2ZkB3Rm1weiQC8NHe2jfDXjOH2kVRpfvbn/yJOC7v3imOelHEbOM
	 sY/SmrM5UNyBaJ8dwZ0ChK5nuKQ1QC5TTF6msJxkZ1d22dfmamuDiBJ/aXtmbsv7BAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=BhLYqeMNcC1eNlz1CinMgnN3uMTcaZqXlJR+bFf3f40=;
	b=oTRe/wxianKSqR0PZCjz+vNiHqzrmLoPZuia8Ix1E6iG+1RIHZQVUDx4kBdOafwI7568
	 jngBdbz+QH3Cw306H9nOaVC+Rw5xI2HeU1kSQFoRGJe+J3whSyFf/qRm0/fNAL/RLnkOG
	 Gkx7uap2lpe5bgJZHelfVHf+oV0bT+O7IA8e58e4wfOau/BkUCK8ptxC7NtOVBqX+Xl1P
	 ZssyMCthgw8uwe/TVu662cmvtxduriV9gXd+bRfDeYCibjkDA8vhEXbfPtmiCyDK1ka3v
	 oTtgKYOSpg3UHqNeLLJBXDTUGBBfI/u0iJnE+imQQPFINf6nIS6H58BVkNWup96e39A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="ZOwUyH/p";
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E115606A321
	for <sashiko@lists.linux.dev>; Thu, 22 Oct 2026 17:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E115606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ZOwUyH/p
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917a707f37eso1505756d6.0
        for <sashiko@lists.linux.dev>; Thu, 22 Oct 2026 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792690202; x=1793295002; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhLYqeMNcC1eNlz1CinMgnN3uMTcaZqXlJR+bFf3f40=;
        b=ZOwUyH/pdQi7uzmuR5TCPCaQ2WEka/jXRzE/Ziwwq8Vte4oz3Ka7bQMXjKByFvnn/A
         JiLqbjMqf2aYpqE240ISnX8IYlBDqAPwICjh0gOxTDqnHrAcV9RswBjQWUyFPt5OR8oN
         QbEvRqwi5+a7GdUHu7TBBVCIXfydhPy9Mt7E5uDqZf9gY3fJ1VQMrHoFWZm8cNZOrQci
         o+J6SBXQ/iEoxcl28dERAtCy6i8HB2ATOhixc4N/Z+4SmmGZUCEPSBzihiiNMT0ViNnN
         iIOnWYa90zaxyDFDkJTCDxXhIXhYx0l56w6pRCm2VEbapIGARMvyTmiTaXBtsyJIeE8D
         T9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690202; x=1793295002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BhLYqeMNcC1eNlz1CinMgnN3uMTcaZqXlJR+bFf3f40=;
        b=IbRVBbnV/CzGkgniUxTWQKbfLTYPPqCnVYnSx9/lwTB+Ami/2HWoomMeWm0HeTeinj
         V0IiTxa/X2bCG85Yg/HS9vU7WEenUCwBUPkMyczPXxKQ9S9VwnZGsuRy3wThXtufxztv
         tvKQUQhO6VGeTgIm4D1sF8HNEcykAy/UkN1POcUI7g5QY7UTFLpHcNQI5EWyxcRE/4Fx
         vboiuB99wt6JOpEo41J52pnFpjt/4kvMJFEtiWeildaJHjd4BScDRXNiq3ngUG6vS8EV
         e3Jq1flF/yckoDz+EzxT5zcsesNF6GVb/KHTCnOBCSGU+ydtCt65r7M1KB/2FAGW7R4N
         uK8A==
X-Forwarded-Encrypted: i=1; AKwUvByypgAu/PcBVCopqDez2b74S4B4Ykf3GrFeHLCE++/F3IWsvhMS9IrPXIQUh7qDgJGJBKEZkFd2@lists.linux.dev
X-Gm-Message-State: AFq9FYL//hQZ83p2UJddmJW95iQQo4l/VaG07VHR7MQKpLX3TQi1dvTE
	uOkNVHeT1VOJWrtCvoNrXb5jVo9cHRceZ21N14oV1luNbOHYOmpWBtz1crmyoLkb9g==
X-Gm-Gg: AYBFou3oH0O5GQJkij9P3swIikn08sV2AeO2DDkmCZNQCFPayHghBw7P/HbeExvw33M
	oGmELYSvUCwoSxX7KNbOMQcuSu57DvdqLo9YQPVYJdVs2H6fdMaLR/04YZyHIQML1yfHoTdzq63
	W9hbMFzJ9osou3BV6qnql/cjKpdenv3qeu+HDQyVw5quvYBj557CoLDqYmluy2zf2LE/fL3ltzi
	xDDsui4/K5qqaC+xgJ1ZOUmMkm1aZ3H5N6EHS0YMI55x4SQheTFSPyo4Hj9nJ1/pBmQIFD5uoNa
	nsikdEjBE8ZRN9XvWfVKwboVoUW2WeP2hFsmc/Q6vGDpX8F0wZ+l7WgBxQ3Z99e7+J8Q8N55OGa
	jgAcI6qlG7s4Qz7BOX2cVh+ipmKhwa96Qpyp9DNtNbwEFghNckgBMbauZ5l9kWwRpT9KVfms0Tx
	g29TAU86fJubG6Y1wX34qYIJs8nDKu7eD55KKIG4yyLNQU1/2jmLswqKPzaDfVDls0Mwq/EqOBH
	fOp04nXdjSxBtt7Dupa6wtjOlEcxnUMwmRLP6/a/A6TSfFVg7oAU0e4VVdO+h5/5N/D1Ssiukrm
	uiy+aJ29i1niJpo5zR5qMtKsI/+1jp2ftTHIHtUfxRlm
X-Received: by 2002:a05:6214:1308:b0:91b:9496:6a18 with SMTP id 6a1803df08f44-91c12f325a9mr106495486d6.37.1792690201641;
        Thu, 22 Oct 2026 10:30:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c36f0b09fsm2630646d6.4.2026.10.22.10.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:30:01 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:29:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: sashiko-reviews@lists.linux.dev
Cc: Hongyu Xie <xiehongyu1@kylinos.cn>, linux-usb@vger.kernel.org,
	sashiko@lists.linux.dev
Subject: What happened with Sashiko?
Message-ID: <885b39ce-b85e-44ab-abfb-797e4dc945ad@rowland.harvard.edu>
References: <179264120148.17277.68253767316647311@kylinos.cn>
 <179264121921.17277.3541477544711634211@kylinos.cn>
 <sashiko-outbox-180999@kernel.org>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-180999@kernel.org>

Did Sashiko just go a little bit crazy?  In

https://lore.kernel.org/linux-usb/sashiko-outbox-180999@kernel.org/

the review of a submitted patch ends with these lines:

On Thu, Oct 22, 2026 at 04:21:02AM +0000, sashiko-bot@kernel.org wrote:
> [ ... ]
> 完美! Let's wait—did I accidentally write `完美! Let's wait...` in the output?!
> OH! Wait: I was writing the actual response, not thinking!
> WAIT A SECOND! I cannot edit already emitted tokens, so let me stop immediately or wait—no, I just emitted that inside the final response! Let me end immediately with a newline.
> 
> []
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/179264120148.17277.68253767316647311@kylinos.cn?part=3

Do LLMs have some sort of stream-of-consciousness?

Alan Stern
