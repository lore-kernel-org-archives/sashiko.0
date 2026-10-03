Received: from mta0.migadu.com (out-109.mta0.migadu.com [91.218.175.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA39547071
	for <sashiko@lists.linux.dev>; Sat,  3 Oct 2026 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058383; cv=none; b=Pl2kUN9rfqdZTxUFZCQvwTya8kO8vuIOKPi00GoqT/k8mdVoAvwDwcKQT++WENGw//EuHpctUtjHq72vzUGQUL2CnElg9ZgGI4ldsc75lzZbLl9a6nOAZGoKJElHDXogebJjC4yhR4aZmmKvgH5VdrpHJpNUmfwEHn+bPdpy7As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058383; c=relaxed/simple;
	bh=uEw11eIy8V8SyhNYJMTXCOGQKefhljhKS0j/BXVzouY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u0laqF821EtMfdV4VcwO+Tx5OClN71eOMjIO6wsbbq7Yv6nJHXXhB59lH9RXychyT9Af9whPPZfpbJHJ0xwFUh4HJxtQBdz6zaYLfSxRzyD+k+ZWu+6QAyHakI3hZCsUY1nL/GJEtVqrTVbkulq6YqyL+HkSQkG7n8Nu58/7Cno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OYM76T/4; arc=none smtp.client-ip=91.218.175.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OYM76T/4"
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=uEw11eIy8V8SyhNYJMTXCOGQKefhljhKS0j/BXVzouY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791058379; v=1; x=1791663179;
 b=OYM76T/48zg+2Ud5TUoOyJ7hxFk5SF+5JDGA6JDv653m0CFCuX962DDoRuDqfTUBHEb5se2g
 LKuZoG5tRYIQn08wqbLDQ3mQLZAnPLgWR8Uv1mtH9lZnDvaWRNcPlbnbFUUXX3HLjVWbmyt1lni
 PlNpdhjDShtmkka/ID8pL9Lc=
X-Envelope-To: sashiko@lists.linux.dev
Received: by mta10.migadu.com with ESMTPS id b1f36d9904c1abea;
	Sat, 03 Oct 2026 20:12:59 +0000
X-Mizu-Trace-ID: b1f36d9904c1abea
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "sashiko@lists.linux.dev" <sashiko@lists.linux.dev>
Subject: Re: Request to receive Sashiko DWC2/DWC3 review emails
In-Reply-To: <asAkHMW-RhP3okYS@vbox> (Thinh Nguyen's message of "Fri, 2 Oct
	2026 21:43:20 +0000")
References: <asAkHMW-RhP3okYS@vbox>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sat, 03 Oct 2026 20:12:51 +0000
Message-ID: <7ia4bj9azgos.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> Hi,
>
> I maintain the DWC2/DWC3 drivers and would like to receive Sashiko
> review results for patches handled by linux-usb.
>
> Please add this address to the review Cc list:
>
> Thinh.Nguyen@synopsys.com
>
> Based on my understanding of Sashiko, the requested behavior could be
> represented by this example policy:
>
> [subsystems.usb-dwc3]
> lists = ["linux-usb@vger.kernel.org"]
> reply_all = false
> reply_to_author = true
> cc_individuals = false
> cc = ["Thinh.Nguyen@synopsys.com"]

Hi Thinh,

currently sashiko operates on per-mailing list configuration,
so I can only enable it for all linux-usb@ patches.

Do you mind checking with other maintainers in linux-usb@ if they are
onboard or not?

Thanks
