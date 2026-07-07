Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16159374A01
	for <sashiko@lists.linux.dev>; Tue,  7 Jul 2026 02:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783392288; cv=none; b=WINR5z33QTrvMKPIZVp1+EVNYlnH7gU6bEwSW1B/pd8npXCgc97pb79rF2r6MIdWRIYlRQYbf5srLBAh9jdme31CShldq/rxAczLK9fMLRR2aJ9v5cf1cn13fDe5B4qezBNi1CTkvAFmJVs9RLf9S4JXdMLo1hbAERmhEbXiWDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783392288; c=relaxed/simple;
	bh=zDsQnChwh2x/AGUpPPnGva3BP1PwhA9YxUIH+2KCgQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=g2YgEbxyuVSP6Ghpsv3/ZAm53ykgVO4goqXxBhEZeYuUaou3DP6jTp8OwkmeHjrJNO9vqyRXrOwm5ygxb8oD+4EDrGdjcu4+5WYrBnW3m7dcSZ3RNazmbeW4Qc4ZJ2uimKVta3kqDNynq593R8wKRQnq0ESfjDAhWegf5KIu52o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HEjne/8K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HEjne/8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783392286;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=LwJh1iP4rpwjJ3ovif/aN2qKnYy3xBCrYMxt6gGdLQ0=;
	b=HEjne/8KqlMOFVtGITxZPtqjp9UYYlMkh52ZFgSkiYxcpuJZnuoRi1sHbtuCTBjx7jQhYT
	EkbB89L/wS9KoTNN49zzs/Os/mZm0WGGjh7BeY9mes08jYwll6gPrinckzjgWuqaCSbfL/
	UwYJ9ff5JPWFkJhmx76fe25cgDOZgno=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-sG7liNcxNwKUg3e_ZbcONA-1; Mon,
 06 Jul 2026 22:44:42 -0400
X-MC-Unique: sG7liNcxNwKUg3e_ZbcONA-1
X-Mimecast-MFC-AGG-ID: sG7liNcxNwKUg3e_ZbcONA_1783392281
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3DCAB18011D1;
	Tue,  7 Jul 2026 02:44:41 +0000 (UTC)
Received: from localhost (unknown [10.22.80.226])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AD1EE180049F;
	Tue,  7 Jul 2026 02:44:40 +0000 (UTC)
Date: Mon, 6 Jul 2026 22:44:39 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko <sashiko@lists.linux.dev>, Chris Mason <clm@fb.com>, 
	Theodore Ts'o <tytso@mit.edu>, acme@kernel.org
Subject: Re: sashiko v.0.2.4 [new sashiko review mode]
Message-ID: <akxOTjXjHCwkVBCx@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <87v7arlwrf.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87v7arlwrf.fsf@linux.dev>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ple1KA3N5rb5ejt25KmblDsgR1f22vfQFjj61uxAYNY_1783392281
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 06, 2026 at 12:54:12PM -0700, Roman Gushchin wrote:
> Hello!
> 
> I just released a new sashiko version with a relatively big feature:
> new "$sashiko review [sha1..sha2]" mode, which is designed to be _the mode_
> most developers should use for the local development. It should be overall
> functional, but I'm pretty sure there is a lot to improve and fix. Also
> "$sashiko init" for the initial setup, which I think we can make more
> interactive and user-friendly.
> 
> Any feedback, bug reports and/or fixups and ideas are highly welcome!
> 
> Thanks!
> 

Looks great!

Splitting up the worker was well needed. :)

Cheers,
-- 
Derek <debarbos@redhat.com>

