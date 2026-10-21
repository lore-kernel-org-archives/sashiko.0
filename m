Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564236;
	b=44Nc0nejYPU+6Fk9SOSn64L83ZxLMEpwGPLyIf21I42K4yXhEeJuPZ13m4AacCwvlcVD
	 6o0may7A1Mifm30VGcJWeUDEWt8ADnwqE5NDwmMuhnuZk2Aw47tQeVhGSlBaRddWK+e0R
	 RaL50O/1Fy63R/EFumYWQIT85xOACeM00WSs1nTQeV3rlKJj7ACXg/fBA1mM0Iwav5o+Z
	 3afFM4u3xSWFCwOSw/cBS3PyXfn51wH+84OUHALN/bs7H/Bkk7so3F15uQ2do3ftntcYS
	 N/uR+EtDYTEzl0MAgiwsZwRGguB49/gshzKyiv3AII8JypC6ueKxE1kSvIFc1ZFNRUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564236;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=cYUvf7NtBe7pOsS1O8UsmectTcO9AE8HzkIVdhBZBbg=;
	b=jbVxCxSydLTcnValdkgpymUtN9zEtpN5lpi1AjrZeDf4kk7tLDGBDDdodMaVW+1rGeVV
	 GnW+q/yBlZ2Jvq9DsH4+hL35ubJ60zvDs8+OMnb+eRpw+BnnYxcT8S8KuK7lqg6JFPvVK
	 RchcR8vN908joGqOG9IaHLfK8dmkTjN8Y71N65A/vyhnemXHQN8/c09ccEntHiN3/7JPk
	 eJijHFL+n6NpvfigFNfbCNtB490slhuxvurXcDKsIpfGsjLpLCwIgmDN5ivmSPxvMrbLp
	 bHehUkaEnYtFR3uwihCbtxCX8ngFclEwVsHodkWV0yRTWcbfq6lAsehMrOH5ldeUcWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b58XjFgS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ux7OP91d;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b58XjFgS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ux7OP91d;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1C1606A31A
	for <sashiko@lists.linux.dev>; Wed, 21 Oct 2026 06:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A1C1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b58XjFgS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ux7OP91d;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=b58XjFgS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ux7OP91d
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6D1241F394;
	Wed, 21 Oct 2026 06:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792564234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cYUvf7NtBe7pOsS1O8UsmectTcO9AE8HzkIVdhBZBbg=;
	b=b58XjFgSc+Rt80lCkLGoCakviThM0StthXv4vGWQrcyWtlZfBmpcO5qOcRDEP1edP08j6Q
	AyJBAWIO0zMszjPAYQ4KrPuk4aZb0vRxvTOBEq5vLY7FLkpeMuAsi0ZJDI3wSQu2MvSaac
	y/65dwKGYltLnaNjA107I2BjRmeLV1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792564234;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cYUvf7NtBe7pOsS1O8UsmectTcO9AE8HzkIVdhBZBbg=;
	b=ux7OP91dbUr09+ZgkPxtqMZjEnmIVU+vkt3po6IHeeqCkJVdrdVTCd+JtXKwfhVvi5m98/
	C+oJoZDZCuRHpqBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792564234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cYUvf7NtBe7pOsS1O8UsmectTcO9AE8HzkIVdhBZBbg=;
	b=b58XjFgSc+Rt80lCkLGoCakviThM0StthXv4vGWQrcyWtlZfBmpcO5qOcRDEP1edP08j6Q
	AyJBAWIO0zMszjPAYQ4KrPuk4aZb0vRxvTOBEq5vLY7FLkpeMuAsi0ZJDI3wSQu2MvSaac
	y/65dwKGYltLnaNjA107I2BjRmeLV1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792564234;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cYUvf7NtBe7pOsS1O8UsmectTcO9AE8HzkIVdhBZBbg=;
	b=ux7OP91dbUr09+ZgkPxtqMZjEnmIVU+vkt3po6IHeeqCkJVdrdVTCd+JtXKwfhVvi5m98/
	C+oJoZDZCuRHpqBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2967D13518;
	Wed, 21 Oct 2026 06:30:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rQzlAApc2GrNVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Oct 2026 06:30:34 +0000
Date: Wed, 21 Oct 2026 08:30:33 +0200
Message-ID: <87ld7rftva.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Takashi Iwai <tiwai@suse.de>,
	sashiko@lists.linux.dev,
	linux-sound@vger.kernel.org
Subject: Re: Enabling Sashiko for linux-sound ML
In-Reply-To: <7ia4cxt48ebr.fsf@castle.c.googlers.com>
References: <87bj8oh7wf.wl-tiwai@suse.de>
	<7ia4cxt48ebr.fsf@castle.c.googlers.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 20 Oct 2026 19:35:52 +0200,
Roman Gushchin wrote:
> 
> Takashi Iwai <tiwai@suse.de> writes:
> 
> > Hi Roman,
> >
> > could you enable Sashiko reviews for linux-sound@vger.kernel.org?
> >
> > In the audio BOF at the previous LPC, it was discussed, and people
> > agreed with the enablement of Sashiko.
> >
> > The preferred configuration is author+list.
> 
> Done!
> 
> https://github.com/sashiko-dev/sashiko/commit/b063c144377b569c39eb3c7d2f689478062fc4f1
> 
> I'll roll it out later today/tomorrow.

Thanks!


Takashi
