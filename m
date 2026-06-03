Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDF7381B0D
	for <sashiko@lists.linux.dev>; Wed,  3 Jun 2026 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496284; cv=none; b=Ci8kaP+dxEKomtlJiESUgwc8AypnOx3rGz6UI3LqRqIkVbBnXR6E8PAUnUYWie47g99awAEZHXsiNBW86YvvPu6qK4OzyM3TlZHt0SeSBwVYwkgtGCD5Vw0p7b0ptJLJl47R9ayZOtNhcSCk5lLo3epxmB8PEWYbfVHFC/ELaNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496284; c=relaxed/simple;
	bh=1CBF/Rb9qVYQ5QyPpj20wcZlcXJ40hy4okKutLG/HS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxlfQ3h/3ZXE/4UqabrfZpg9Xz+09DKjLuK07HGOYuNAwXhaHXNqqNfRC8tlNyT6GozTHNFdZIq6OhXMthMlyvHr5PkwBCYusORvmYrCrQYtB2cqUOw/1EFclRRIaZDJH6g6adf9eGrnKYGfhaGji9lzwt/jbR9j+ZkJ4Jqj8Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=HJt3Y9zx; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="HJt3Y9zx"
Received: from macsyma.thunk.org ([104.135.218.90])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 653EHoX7007434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jun 2026 10:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1780496273; bh=TMfv6hWYRSSrWx5RnZ1/1kMXl6wD1l6vkv0zX73Tj+o=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=HJt3Y9zxYUd/yWXHbU6u+CDDfjGLFELdDdiGi+vPCri/rSq4yg305ZRkFgHDSMgRU
	 BEV+qvnon/tW/TBzuzLWayJrTsXIETrycRfDyX9bmys2S1Zp9p1qzVADAgNWgoqjNY
	 v1wctj8u4HTqs6VjcGBMRxKYh6u/ySPxOdnjwth59xtn64VmBRFLPEPBwKjlKkeyq4
	 LpOD5RGrT1sfP5LHSuE4eo5Z7BbraqqPilymAE78v+uAWd4KqUfPrt0QvMOPd/naVr
	 e9WCCqhyDQnQQx88FBva45jwJIT6htbHFrz/eN9fCnP5YJegTyKfaBRxNh7Sl/K67u
	 dkaOBvkjqyRZQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 8A61035EA54; Wed,  3 Jun 2026 10:17:50 -0400 (EDT)
Date: Wed, 3 Jun 2026 10:17:50 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: sashiko@lists.linux.dev
Cc: linux-ext4@vger.kernel.org, Baokun Li <libaokun@linux.alibaba.com>
Subject: Re: [PATCH RFC 10/17] ext4: use fast incremental CRC update in
 ext4_free_inode()
Message-ID: <h3n7jlfhyna64dn5o76qxcspnhxdddcs6crpxftmy7gnl7b3sx@jenszfpcsnit>
References: <20260508121539.4174601-11-libaokun@linux.alibaba.com>
 <20260508233305.EB600C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508233305.EB600C2BCB0@smtp.kernel.org>

On Fri, May 08, 2026 at 11:33:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ext4_inode_bitmap_csum_set_fast() corrupts the inode bitmap checksum if EXT4_INODES_PER_GROUP(sb) is not a multiple of 8.
>
> > -	ext4_inode_bitmap_csum_set(sb, gdp, bitmap_bh);
> > +	ext4_inode_bitmap_csum_set_fast(sb, gdp, bit);
> 
> Can this corrupt the inode bitmap checksum if EXT4_INODES_PER_GROUP(sb) is not
> a multiple of 8?
> 
> In ext4_inode_bitmap_csum_set(), the CRC32c checksum is computed over exactly
> EXT4_INODES_PER_GROUP(sb) >> 3 bytes. If s_inodes_per_group is not a multiple
> of 8, any trailing fractional bits are strictly excluded from the checksum
> calculation.
> 
> Because ext4_fill_super() does not enforce that s_inodes_per_group is a
> multiple of 8, a crafted filesystem can have an unaligned s_inodes_per_group.

The reason why ext4_fill_super() doesn't enforce that
s_inodes_per_group is a multiple of 8 was that a long time ago, back
when Android was allergic to GPLv2 in userspace, they implemented
their own version of mke2fs (and didn't run fsck on the file system,
sigh).  Their MIT licensed version of make_ext4fs would occasionally
make file systems that were not a multiple of 8, and this ran afoul of
e2fsck[1] if someone actually tried to repair a corrupted Android user
data file system (as opposed to just wiping the flash and starting
from scratch).

[1] https://sourceforge.net/p/e2fsprogs/bugs/292/

This was fixed long ago (over a decade ago), and so at this point, I'm
pretty sure any such mobile handsets are in the landfill, so we
probably should fix this by adding a check in ext4_fill_super() and a
corresponding check in e2fsck.

					- Ted
