Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988417;
	b=EGcO+jXrKChrniF3600PnesfyIW+drYWpRkdANh+xohMSQDUwi8ihGpofh55X6QeCynO
	 x+Brz8h56aAtQ+r2V+NBRPQuyFHn2w0qvRBgwaYR1XPC6+Lp4zsLJauzHi43nNCXLlOsq
	 gN3Q3rvGW3NNTW0Ur9pQ+IulFSGRWRrTEaQAqy6kcaxWH93fIbyF9Kk2hSFciPmW6Po6Z
	 9P+Y3D76PWZk6xHcuQ96aJNgnLZ5itBTqxySjO1c9jcM3asElwO+zdcuE8xAkWJG0yDOG
	 h3xEqG9Kr99PSV6RD29zkEwN6rrSOD5jMJa8L5jjkySgSF9Wrg9jRXSO/bosSl9jMdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988417;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=b7bwUXugmVGuIIm4wGoslG4ej9FrGSL/WtU06h+6y6M=;
	b=xa3m32fu1EOSPtUlejQMoDYW9gumi6d9QmspOib2We+xsshoMvcde9vkPwbumFMesJUw
	 Lrl8N7FOhkJ2d0QDKUSFLAP7JTVNDsgSa7mRpDeQASl313mr2d951iPw7mbbkhto0JjFM
	 sgwe0lBK+FqfVVhx/uUsaOZwXEal97IGx51Y3eC8HcM9aCoT4cO8x6C3SsefFoEYqvz+O
	 DevrPL3hTZ7RXcS+FylKbB2N+w3cw63oWiDXVdrZ1nFmq/tm6dn4d5gP5MPigAXmCHNQA
	 wNcWaJoI6is+mJbwJ6HE+P9E1Ortl+BN1Eca7BN9PQ4PTHVrji6WTYJF3frEgNOebew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nG5mJ0l8;
	arc=none smtp.remote-ip=91.218.175.92
Received: from mta0.migadu.com (out-92.mta0.migadu.com [91.218.175.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57D6606A325
	for <sashiko@lists.linux.dev>; Wed, 18 Nov 2026 07:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57D6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nG5mJ0l8
X-Envelope-To: sashiko@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=nTbgEmKnXYDBu3OqGkfNm1HRD+xN4s1F4VElGzerOvQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794988415; v=1; x=1795593215;
 b=nG5mJ0l8k6c0xm+dfFXW83GU3POT2zowE8UneSbN65H4I1HNSaSrRWqY5Bbo+9KJf76paQeY
 FRU0jwHjQL/0ju43Yl87qw6JuOk3FI3SLLWBT0z6JZ0OH1zTjfbWv8W/mLUVFX6BVx3jnIuhwED
 CVaMP8ypDcgWZZrRgz9RjS24=
X-Envelope-To: sashiko@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 70be349846b7b404;
	Wed, 18 Nov 2026 07:53:33 +0000
X-Mizu-Trace-ID: 70be349846b7b404
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 07:53:33 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Baoquan He <baoquan.he@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
CC: sashiko-reviews@lists.linux.dev, Zack Rusin <zack.rusin@broadcom.com>,
 Petr Mladek <pmladek@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Dave Young <ruirui.yang@linux.dev>,
 Borislav Petkov <bp@alien8.de>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
 Joel Granados <joel.granados@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
 bcm-kernel-feedback-list@broadcom.com,
 John Ogness <john.ogness@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Kees Cook <kees@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Bo Gan <bo.gan@broadcom.com>,
 Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
 kexec@lists.infradead.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Stephen Brennan <stephen.s.brennan@oracle.com>,
 Michael Kelley <mhklinux@outlook.com>, Ian Forbes <ian.forbes@broadcom.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eugenio Perez <eperezma@redhat.com>,
 sashiko@lists.linux.dev
Subject: Re: [PATCH v4 3/4] x86/vmware: Add the vmware_record_panic_msg sysctl
In-Reply-To: <av1ZB3ia13M420_I@MiWiFi-R3L-srv>
References: <cover.1794980455.git.zack.rusin@broadcom.com> <4c5de34b10f579368b890eaa9333a2755886bad3.1794980455.git.zack.rusin@broadcom.com> <sashiko-outbox-220212@kernel.org> <av1IuMZ2W0SXWcNn@MiWiFi-R3L-srv> <20261117230201.921ec5bddf49cd459ddb8428@linux-foundation.org> <av1ZB3ia13M420_I@MiWiFi-R3L-srv>
Message-ID: <AAB2E512-6577-4AA9-82E3-F8297A4CBDD8@linux.dev>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 18 November 2026 07:51:35 GMT, Baoquan He <baoquan.he@linux.dev> wrote:
>On 11/17/26 at 11:02pm, Andrew Morton wrote:
>> On Wed, 18 Nov 2026 14:42:00 +0800 Baoquan He <baoquan.he@linux.dev>
>wrote:
>> 
>> > On 11/18/26 at 06:14am, sashiko-bot@kernel.org wrote:
>> > > > Allow administrators to disable host log transfer on ordinary
>guests or
>> > > > opt in on encrypted guests. Expose the boolean recording policy
>through
>> > > > kernel.vmware_record_panic_msg using proc_dobool(), as Joel
>suggested.
>> > > > Zero disables recording, nonzero integers enable it, and reads
>return
>> > > > 0 or 1.
>> > > > 
>> > > > Register the sysctl only after the logger is ready. A registration
>failure
>> > > > leaves the internal default in force. Document that the log is
>sent
>> > > > before kdump, and that disable_panic_notifiers_platform_list also
>skips
>> > > > it.
>> > > > 
>> > > > Link:
>https://lore.kernel.org/r/4e73yd2ofpdzl6rptzvd74no3hnyfblknoq7wzxlw7f3zjbz7c@srfabx6lsusj
>> > > > Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
>> > > 
>> > > Sashiko has reviewed this patch and found no issues.
>> > 
>> > It might be better to turn off this message if not issues found, just
>> > like what LKP bot has been doing.
>> 
>> (+sashiko@lists.linux.dev)
>> 
>> Yes please.
>> 
>> These emails do have a little bit of value: they tell you that Sashiko
>> was able to apply the patch and to review it.  I guess.  Or something.
>
>In that case a message saying Sashiko can't apply the entire patchset
>is better.

yes my sashiko emails go to spam automatically (not cuz I set it, but 
cuz I get so much "no issues!" Emails, that it clogs up my inbox. 

What even is the need to have the no issues emails? If one was THAT
interested in sashiko, they could search for it?

>
>> 
>> Me:
>> 
>> :0 D:
>> * ^From:[ 	]*sashiko-bot@kernel\.org[ 	]*$
>> * B ?? ^Sashiko has reviewed this patch and found no issues\.$
>> /home/akpm/.nsmail-zip/Trash
>> 
>> hp2:/home/akpm> grep "From:.*sashiko-bot" .nsmail-zip/Trash | wc -l
>> 1140
>> hp2:/home/akpm> 
>> 

--- Thanks!
