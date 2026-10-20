Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499395;
	b=skpwwVXqyfSX/g0fC61sjRV+G3SgXF2sG9hp2WNBa6u+SotXIJ05yH73uKt+PKUHpgGZ
	 liqZ4RFgr28lFa7T1I9zLft4nLZm04bm0l8eT0XmKszY6Gh5TMc9luBs1LS/GDM0yTeQp
	 G0EPwINalRfJCyyth4gFFfhzG3Oy+kLUpOAgcjNvh+/U1sHP5wP0+UfENrxtDZ6WJzKRj
	 WwuuFNfrjQgFtO6uWtsQWPW0N8veqLMUC3PpFZaCVhr5qcA+bSodEd98r4maEDIOkP2FO
	 S0iMdDq9ajHGoxDX94JuDEk14rtZrgdJY/DhG3zBCnBjAtpieaIguCIPvJ7KxSOzY8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499395;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 User-Agent:MIME-Version:Content-Type:X-Spam-Flag:X-Spam-Score:
	 X-Spam-Level:X-Spamd-Result;
	bh=k6QoccHr1ileDqkYuy26FQAqHmbiQ5NJoqeTY5As/X8=;
	b=kbUovxLsFJYFFq5TM7Wh7xoP3HiXXCDKOpAPBkTZD/4axSZd3pRXXr1ALb/x4dz2DA/T
	 iNnascVX3beU4/6twZzpPLnmRSztyDRvOxOKiSZOF1IK4qctUyJmcRGbAgMOnxQy2UeCR
	 mI3hX+awYsDoJ7FFhGmHXKEsCEhn8DXp2JwqgM+VFTsrjxCgxKrYZ6Yu0VUoRS6VEbvXZ
	 VRPzHVFmiHZlQLWOp+JNEZa/vpglUbkpubaGsPLB+pI6B+M36vaheJLR2M88JR2LM+X6y
	 jbZ3vqPkbBsT3tGVVeq3Ls7G1In6CPaKnQbjdceZba0nY6a9i0e2F1BRgIhsbYyRgpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=voTGvjRH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WBxh1J1U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=voTGvjRH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WBxh1J1U;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D906B606A319
	for <sashiko@lists.linux.dev>; Tue, 20 Oct 2026 12:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D906B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=voTGvjRH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WBxh1J1U;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=voTGvjRH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WBxh1J1U
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 25F4D21D9D;
	Tue, 20 Oct 2026 12:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792499393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=k6QoccHr1ileDqkYuy26FQAqHmbiQ5NJoqeTY5As/X8=;
	b=voTGvjRHpZL2o9qLY0AooD8DL9KbRF5bdbQBzTasi49qyImqrN+Tvgt1+k7L1xsJiP3iFm
	K2qFZc+s7jkIuq9D25iotVKbliT2jlAJL4mnuvxe1w6U5SneVchOITaj+z6NjYX53ABFBi
	jYp2NAVku/HRy/SN/gdR27EQSE8CO9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792499393;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=k6QoccHr1ileDqkYuy26FQAqHmbiQ5NJoqeTY5As/X8=;
	b=WBxh1J1U+42mxawXt3zJQWIZYYe9ELLnqjnzj/cHgxxlaoSJJIIHKDo3m58z4KtPTS1Ndd
	DDWhdNx+Shvu35Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792499393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=k6QoccHr1ileDqkYuy26FQAqHmbiQ5NJoqeTY5As/X8=;
	b=voTGvjRHpZL2o9qLY0AooD8DL9KbRF5bdbQBzTasi49qyImqrN+Tvgt1+k7L1xsJiP3iFm
	K2qFZc+s7jkIuq9D25iotVKbliT2jlAJL4mnuvxe1w6U5SneVchOITaj+z6NjYX53ABFBi
	jYp2NAVku/HRy/SN/gdR27EQSE8CO9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792499393;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=k6QoccHr1ileDqkYuy26FQAqHmbiQ5NJoqeTY5As/X8=;
	b=WBxh1J1U+42mxawXt3zJQWIZYYe9ELLnqjnzj/cHgxxlaoSJJIIHKDo3m58z4KtPTS1Ndd
	DDWhdNx+Shvu35Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE8C7136CC;
	Tue, 20 Oct 2026 12:29:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PRXJI8Be12rPQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 12:29:52 +0000
Date: Tue, 20 Oct 2026 14:29:52 +0200
Message-ID: <87bj8oh7wf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: sashiko@lists.linux.dev
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
    linux-sound@vger.kernel.org
Subject: Enabling Sashiko for linux-sound ML
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
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.991];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

Hi Roman,

could you enable Sashiko reviews for linux-sound@vger.kernel.org?

In the audio BOF at the previous LPC, it was discussed, and people
agreed with the enablement of Sashiko.

The preferred configuration is author+list.


thanks,

Takashi
