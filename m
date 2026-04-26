Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB281EA84
	for <sashiko@lists.linux.dev>; Sun, 26 Apr 2026 07:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777187701; cv=none; b=B5QtFTe7XT75nG0/9X8kSTMu9469oBs43kzHKy1lviAAW5b/sxgpIZ4DddGWwdMEz1GZJWRuhYfVG/DZs/h/iOCijk/p9Q92vKWGKk3lScstUVsaxREuvAV3eAxnJmB5BEWwXfRZwsBBFrtOhSR3L1QuK8PvvXSEJFdSjrc+/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777187701; c=relaxed/simple;
	bh=KXACoXgXGoLWjfJrX4SWSVxOpLFlMkKQFjvpyCg4tOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZiaCOqNjpJ68zyM+TShizghr1i3heSdntInpoQkDNRFL3ess52G/ZGQ4vqalBD/Qc7sJNPtwyESjM/1q6tK9lGBnCOlwhgWAZ37fkb7D1Ltp/2CNgdcYwilOre57hFpIi3nCrbhONAKPBKXbJsajc5zd/PgU5OOs5muxPZj7E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=TKeHWJH6; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="TKeHWJH6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N3thNfZAmTI4LXnlPTPtP4es/P8zH+IfhJROb8fsQ/A=; b=TKeHWJH6doJz63Lbfwu8MVQ4z1
	5fV5DbyPmcTCcVBpGJlnvQ6sOboP8vx9C2/0VS0dnwecyuYf01Fauy4NRDVBJ4Qn0r8/1h13JCZQ0
	4H0VUjoFWevjVSWamnts7aiaO28y5DHct3IqOfV66z61LiYkNpbPaVDWmV2oXU0+sTTwnIWsbHef1
	VnkSuaP7cCYJ88kSJ2A8wKOM1Zs47G/CDx8pVgQTxAyH0AvqI/kOdMOdlOWdQeO2QOu9n8C3ZHWai
	SNAPGOhdJT2LiCuVcsziUaJ+O6A8IuSpYtnY6XYhq/zsuGxX1B8ZANpjJ9oyK1MLFc6cX7ogWw3Xa
	RMCfBS7w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wGthl-00000004brV-0PMM;
	Sun, 26 Apr 2026 07:15:01 +0000
Date: Sun, 26 Apr 2026 08:15:01 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: sashiko@lists.linux.dev
Cc: tytso@mit.edu
Subject: Re: why does ext4_sync_parent() bother with d_find_any_alias() at
 all?
Message-ID: <20260426071501.GR3518998@ZenIV>
References: <20260426061009.GQ3518998@ZenIV>
 <20260426064847.49E5AC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260426064847.49E5AC2BCAF@smtp.kernel.org>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, Apr 26, 2026 at 06:48:46AM +0000, sashiko-bot@kernel.org wrote:

> Prior to this patch, d_find_any_alias(inode) would reliably fetch the newest
> dentry (the new hard link) from the head of the list, successfully traversing
> and syncing the new parent directory.

FSVO "reliably"; apply memory pressure and all promises are gone.  As the matter
of fact, have another thread link() into a different directory and unlink() the
result before your fsync(), and you'll end up syncing a directory that has no
links to the file in question.

> By using file->f_path.dentry, won't ext4_sync_parent() now target the older
> dentry used to open the file descriptor? It appears it will traverse the old
> parent directory, clear the EXT4_STATE_NEWENTRY flag, and miss syncing the
> newly created link's parent directory, potentially losing the new link in the
> event of a crash.
> 
> Additionally, if the file is opened via open_by_handle_at(),
> file->f_path.dentry is a disconnected root.

Quite possibly returned by d_find_any_alias().

What warranties is the entire thing trying to provide?  Anything that relies upon
the order of dentries in the alias list is going to be quite brittle...
