Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D2F3B388D
	for <sashiko@lists.linux.dev>; Tue, 28 Apr 2026 14:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777385560; cv=none; b=S5em/tfk9IdSTAqGGXUjx0rbwpXnmj3HP2PxP9ffVMh2kAEiSaLaaKxvJQNGJPdcEIqnj7sIg/bLEnyUstQ8VRBQFRMV3aiJn8qc2+4+YLxnVuZPDllTOqKJ+fabTxGKi6vWFKjHqLQF/8HLR/B7Qfqz/yW+gKDf2CQbP/4tSRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777385560; c=relaxed/simple;
	bh=ma3UYGKNCnI4t10PkYOcqJBWS/sX8jMTZgZoAi3TyB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ktb5KPTomYcIuMzfDmETo6agegZmtGJ+lDF20Z5EtqRVmXEuOW3P//yMC+ENBMJzSb23f73aECFkxqFdovN0kt52JaU1+nUH87J33hIvjMAaH2VKhi5nSr5QYnCLis5SYn9UDpFcuwIpeYztsx9IwzmomeY8LizgXs0l3fDRTrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=SiezUXYF; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="SiezUXYF"
Received: from macsyma.thunk.org (pool-173-48-114-3.bstnma.fios.verizon.net [173.48.114.3])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 63SECYOr015597
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 10:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1777385557; bh=hm5ob9pCg3LGXuSvZi0p0zOCvXGtMhyCVjV7t5Fl8Hg=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=SiezUXYF8VUnzcQBMlcxzYE/hu7/6ANSp0c/gxbW94JLzgNgQ/+ty1XoJEhp+5gwg
	 nb/p4Rf3fL1h4ey0/q8lypCptCF8ZoH/RlQzZIC68v34KGstWKt3DN6Sg4+ppmsSeP
	 5ssS+vz+snihW3uXBd+/fDzcJkU4TDiDJM4v9UssHxJ2oainzFRzEN6A1gkzidQ77F
	 cuMP3ZchTY00fGzFiHovzoR//IfItofcWQfvO2O7gCOYXRhLSP2S+eNGyAjaqLwk37
	 uRghtQo/yeCQiuiOB1FOcV/YhbRgcOBg5U3cACFWVIyE0JqbTtgAu/4o5PNqvzp7xr
	 D0SFqq/4GcmmA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 66158655B8D8; Tue, 28 Apr 2026 10:11:34 -0400 (EDT)
Date: Tue, 28 Apr 2026 10:11:34 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: sashiko@lists.linux.dev
Subject: Re: why does ext4_sync_parent() bother with d_find_any_alias() at
 all?
Message-ID: <20260428141134.GB71700@macsyma-wired.lan>
References: <20260426061009.GQ3518998@ZenIV>
 <20260426064847.49E5AC2BCAF@smtp.kernel.org>
 <20260426071501.GR3518998@ZenIV>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426071501.GR3518998@ZenIV>

On Sun, Apr 26, 2026 at 08:15:01AM +0100, Al Viro wrote:
> 
> What warranties is the entire thing trying to provide?  Anything
> that relies upon the order of dentries in the alias list is going to
> be quite brittle...

Originally, this was added not to provide *guarantees*, but just to
make things better in no-journal mode, where the parent directory
might not get written until 30 seconds later without a journal.

commit 14ece1028b3ed53ffec1b1213ffc6acaf79ad77c
Author: Frank Mayhar <fmayhar@google.com>
Date:   Mon May 17 08:00:00 2010 -0400

    ext4: Make fsync sync new parent directories in no-journal mode

    Add a new ext4 state to tell us when a file has been newly created; use
    that state in ext4_sync_file in no-journal mode to tell us when we need
    to sync the parent directory as well as the inode and data itself.  This
    fixes a problem in which a panic or power failure may lose the entire
    file even when using fsync, since the parent directory entry is lost.

    Addresses-Google-Bug: #2480057

    Signed-off-by: Frank Mayhar <fmayhar@google.com>
    Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>

The use case that we were optimizing for was for newly created files,
and if the common an atomic write pattern wan't:

    fd = open("dir/foo.new");
    write(fd);
    link("dir/foo.new", "dir/foo");
    fsync(fd);

... but rather:

    fd = open("dir/foo.new");
    write(fd);
    rename("dir/foo.new", "dir/foo");
    fsync(fd);

So I'd say that what we are trying to do is to provide a best effort
attempt to avoid data loss in the face of crashes where (a) there is
only a single directory involved (e.g., where the application program
is renaming "foo.new" to "foo" in the original directory where
"foo.new" was created), and where there aren't other processes trying
to play fancy games with a newly created file.

This isn't documented as a guarantee; we're just trying to provide a
better experience for application programmers which don't realize that
POSIX requires that you fsync the directory if you really want strong
guarantees, on the theory that the application programmers vastly
outnumber the number of file system developers ---- and application
programmers tend do the darnest things :-)

In any case, because of this background, which an AI review bot would
have no hope of understanding, I think your patch is fine.  :-)


					- Ted

P.S.  We also have a similar, but unrelated "save the clueless
application programmer" hack where if the user does:

    fd = open("dir/foo.new");
    write(fd);
    close(fd)
    rename("dir/foo.new", "dir/foo");

... on the rename(), if foo.new was a newly created file, we will
initiate an asynchronous writeback.  This was a compromise where we
didn't want to impose a performance tax where it wasn't necessary, but
it was truly *shocking* how common the above pattern, sans any fsync
at all existed in many GNOME and KDE libraries, as well as the
TuxRacer game, where it would write the top-ten scoreboard, and then
close the 3D MESA library shortly thereafter, at which point the
proprietary Nvidia driver would crash the system, and users who lost
their 10 ten score were very sad.  :-)   This resulted in the whole
O_PONIES discussion / compromise in 2009:

    https://blahg.josefsipek.net/?p=364

Again, all of this is best efforts, and the philosophy is to work
around buggy userspace while minimizing performance overhead --- and
especially, *not* penalizing programs that do things correctly where
they are supposed to.
