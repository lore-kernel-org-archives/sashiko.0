Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8631DDC1B
	for <sashiko@lists.linux.dev>; Thu, 18 Jun 2026 23:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781825752; cv=none; b=DeCJehfR6Qtynlt7fR9Rbns5g+APdWgBOZgakCZoeAcj4OZasJcQu+6HGFhSVu0czxg3o6ZlqUDwpSu4oDlOYkb9wAprYMS6SpMrHu0oSKSKsAq1V2nhja45tOixBWdnsreeENc8Mgr06aFyYguEaKHu+me08iPTo3SAnlrEw7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781825752; c=relaxed/simple;
	bh=lsktn//grkYckJ9Eoj9vBqk4WBGlof5JT6nnzYeedDk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=crlgHG9Wlxs6pBpx/ZIsDJ1Oil5hsKQCNWpAUkxQV3D0zDWWpShV/6pklk0dF1oFzdkAduH39jJwfsD3DiAf5wqiix5U2oIFuXk3eyijmmpbWLTgQxzsJ/R5W9qK58S0xYi/ZgzVUOwJo8lTCLatxc7gy8mvNlsxIynNyUMNTIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pR3nImkb; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pR3nImkb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781825738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lsktn//grkYckJ9Eoj9vBqk4WBGlof5JT6nnzYeedDk=;
	b=pR3nImkbiiXi7BTDPJrWhuxyIV2V1oQ9vm5JGnLnQTSP2NYjz64stYXvtZu5j/TWhHOXW9
	NIBIWvUOPPUvDTQYTBrLAvtZE6xP90PLyZXMAktCKAuC397uH9DerNcBs3fQr/NQ86NI/i
	X2PwAaJ80epH6KRmxRs1AAXwK1H1W0s=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Amir Goldstein <amir73il@gmail.com>
Cc: sashiko@lists.linux.dev,  overlayfs <linux-unionfs@vger.kernel.org>,
  Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: Sashiko reviews for overlayfs
In-Reply-To: <CAOQ4uxiJjVvrAwB4kcSsKsjgjtDyfy-1zDS=sMMt5Ke0ZQRSHA@mail.gmail.com>
	(Amir Goldstein's message of "Thu, 18 Jun 2026 21:11:59 +0200")
References: <CAOQ4uxiJjVvrAwB4kcSsKsjgjtDyfy-1zDS=sMMt5Ke0ZQRSHA@mail.gmail.com>
Date: Thu, 18 Jun 2026 23:34:45 +0000
Message-ID: <7ia4ldcb1kyy.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Amir Goldstein <amir73il@gmail.com> writes:

> Hi Sashiko,
>
> Please review patches sent to
> linux-unionfs@vger.kernel.org

Hi Amir,

https://sashiko.dev/#/?list=org.kernel.vger.linux-unionfs

Thanks
