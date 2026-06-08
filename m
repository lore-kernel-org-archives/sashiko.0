Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C0027E05E
	for <sashiko@lists.linux.dev>; Mon,  8 Jun 2026 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926264; cv=none; b=NOUwXG6aUC0/gRw0oJz8rPciXqYn4PsJZwkaUWO9hS4nEg9ux/tLWYOAcppYMdfv0HZUFdqgDY90XjFhZK8NoxI2KJIlt/eNj1ffXQ+zIoLFospsoSLMFet9NfLw2BhbYhiJVLNfNvNDoQ1frAWvNUXqSERVUXPRImSM8Iq8i/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926264; c=relaxed/simple;
	bh=pC+ZBqw0AW5f2o+9aehoCENggtUVZnaHC6WxsyeYmv8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qrgFaBI6CFD0MQFUBxsM082KYDxEccNtK29AEdxxy2GTZWMzzbGdcz6SQJsQTRJLHl4guc9pGNj/i77FYSu+hXSM5Zh0okmviEArxIvJvsO1dAgUVgcea88vbFwxZgt10nrxcQjE25cS38BJOCqRJu9beyYh0WQzhsgz1j8QQIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyILnlNd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyILnlNd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BC71F00893;
	Mon,  8 Jun 2026 13:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780926263;
	bh=pC+ZBqw0AW5f2o+9aehoCENggtUVZnaHC6WxsyeYmv8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=DyILnlNdfhkLb9czxSbWPs4rU+qtTtmrRQKS/fLee5t0GMII8ydbtClXeG4SJ8Mgy
	 7hCwHDCfiLjV4VQrnJ7OtSCdpAtKIVBMNL0kWKPHL1bvspgxB47eCA1DQIQoKzxQyL
	 UCA4Z9kVRUUx+wxtFaEogdkErkT+06QIIDaLtcEUMX4qddIsxG6DEwaiFTOFzTRG/j
	 ebH0Nvav6VFfrNVqxCD835k+Wvn3Aeg7TS9MuPdXgY4//lHEFGNKBoPHn3khQb6qNr
	 4FQ5/z7O7VYnYGqUDLDe5sOwak9Geu0wKTub1FyP6/FM01UrbxE5GYbtz+wNYf7MWF
	 mrU+7Zpm+h4qg==
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 15:44:20 +0200
Message-Id: <DJ3PO5LX7TQK.3BS0W5EV7NB7C@kernel.org>
Subject: Re: Sashiko email policy precedence
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <sashiko@lists.linux.dev>
To: "Roman Gushchin" <roman.gushchin@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <DIX8UX2TJP8E.4OAWKUUF5JG1@kernel.org>
 <CANiq72mSpur28Fz8YL7_-FJk_h008kt=sw6mLeSsRNmiy+ko1Q@mail.gmail.com>
 <DIXM8JL1CM5A.315I0YBSDJT5O@kernel.org>
In-Reply-To: <DIXM8JL1CM5A.315I0YBSDJT5O@kernel.org>

On Mon Jun 1, 2026 at 11:46 AM CEST, Danilo Krummrich wrote:
> Flagging something as wide list seems rather simple [1], the tristate [2]=
 would
> work as well, but seems a bit more complicated and potentially requires
> adjusting the existing policies.

Roman, any preference on either of those or something else?

Thanks,
Danilo
