Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E2547A878
	for <sashiko@lists.linux.dev>; Tue, 13 Oct 2026 14:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903471; cv=none; b=tLTCkTWbHfbS/yTnVMW2mdsLxR1z68sA8qaAIIJJqKrguochcUqCTGRIpL0prdaTSCplfJWnEZ3xnBerK7hEwK2kVGfiQB07Q/zMDSbNq3Jlme8nyTLmzlrWQvqfcZKQzwOJnVmAsA91xXLPjqOBwGploXjHq9DvrcroEXQp1oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903471; c=relaxed/simple;
	bh=65aHucoXob7uszu5me17bAdO+axC11fQgcFjAvsCe98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dobHHfhBej7ntEsRZ4WpnAs3sIW41x+qWxxVopsNhJi0Tm4kNhvbbbxHO2GiRTM59/w+dC716gxlxJ8B9xIxhJXxbCTy38FMMXv3pd75B6MzXuNvLaUdTlEhNVHf0QGP8Rmb/1HbpolgZ8KbSBzykueM+j4asjh3rdieEZt9ajM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eT5aaJp8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eT5aaJp8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743341F000FF;
	Tue, 13 Oct 2026 14:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791903469;
	bh=pLRdpUbQKDpJU0ZzfZzOunSuRJ2HQrmbzSqRSvl+Xqc=;
	h=Date:From:To:Cc:Subject;
	b=eT5aaJp8KbYXLhjQAXjo0DDPXqNxnYQkZJbwxLvegZBaHrN04USsHaK0AYDsb61k2
	 ZAnLwf4DaVjYeR0cZNpUfDIJulFKrc2+9anhDzY4Ph+HrY5WkWAHJ8GRsmuKhSbzeZ
	 yjh/ADWU0FZbk4jB4DW4WPuaQDE4JxLG4wzfLEc77PL0iSou66n7OXkI6iaC1ri4O9
	 e1xKw6OeOxTqFT/fuidLIL9WFZq0h8ZeBrcY6TbTEwsAzgMxtn4WR2j7R21kxjao9o
	 y9sU9PkrMRFRDwLda3TUWpsbHOjgjtboMsjNniWgBfIfRzI8+LRMjGTQbt9Q4LwDFb
	 FgCd2S0hZKEjA==
Date: Tue, 13 Oct 2026 08:57:48 -0600
From: Keith Busch <kbusch@kernel.org>
To: sashiko@lists.linux.dev
Cc: roman.gushchin@linux.dev, hch@lst.de
Subject: request to subscribe linux-nvme
Message-ID: <as5G7HWh3TovdMOq@kbusch-mbp>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Christoph and I maintain the linux-nvme driver and we would like to
subscribe our mailing list to the sashiko review system. Our mailing
list can be found on lore here:

  https://lore.kernel.org/linux-nvme/

Thanks,
Keith
