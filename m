Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C01C4BCAD7
	for <sashiko@lists.linux.dev>; Tue, 19 May 2026 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779194013; cv=none; b=Z8jgNFkMZfnvxHUa3mG/QrTm31w09dlfc5vfNlDvZwp0WzaLsZVZS/pV0kxZnbtNCGue3YKb5wOiahLatWdyh2wby6sK4DzsCeloy+caLgwi0F0pl6gqZauM8JmphUKNooRtbxZKPs4EoyF3/KqAWd76tyIAN1WtEhQhSiHgYPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779194013; c=relaxed/simple;
	bh=4mY/hEM5AaZPgSsnVizOgAJ6pUgmTUk/0dnpQsV5zLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZcseZ+6K5ZVQUGysIPSyDCqgU+NPA6kZ6MqJ8CGpc9hvdCUHNIsnJzUF29gXEoKFswBpzEnbW9k/8Sjdnm1PcqIXQGttyT9pEvhiNG3YzUh1HVW2sTJzL64W/H3A1YopZuUiNCOHQ+oYdNvk5SZOoMt/08l14csEJ+yXGu2OZ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Eh5h0PT0; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Eh5h0PT0"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Y2ghU7/d9fJ2EwQStmvtFtgusc+xZLpmXAu1ErFav1s=;
	b=Eh5h0PT0EuBlDi1k4OPGF9EmhX709ff2dOzaFYZw3Lvp7J00BI2gMczn+l0NvjuNn8HYpGCbR
	WhWkueuLOaiLn6dwx8PaUhdsquk9E4JIXYcwfPBM4JJJFathFUb5c6dR0H1DlU1yLq9Ujc3Jm6E
	lcwIx4QH9OrGalzbkkIH7Fo=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gKYn23qG6zpStS;
	Tue, 19 May 2026 20:26:14 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C971F4056D;
	Tue, 19 May 2026 20:33:26 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 May 2026 20:33:26 +0800
Message-ID: <485362fe-9434-442f-8db1-1571430d8853@huawei.com>
Date: Tue, 19 May 2026 20:33:26 +0800
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 04/15] arm64: kexec_file: Fix potential buffer
 overflow in prepare_elf_headers()
To: <sashiko@lists.linux.dev>, <catalin.marinas@arm.com>, <leitao@debian.org>,
	<bhe@redhat.com>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
References: <20260511030454.1730881-5-ruanjinjie@huawei.com>
 <20260512004533.B4863C2BCB0@smtp.kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260512004533.B4863C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 5/12/2026 8:45 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Memory leak of image->elf_headers on error paths in load_other_segments().
> --
> 
> commit 176ac9ad5382c8a7611ce5e111bc472c392e772b
> Author: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> arm64: kexec_file: Fix potential buffer overflow in prepare_elf_headers()
> 
> This commit fixes a race condition between the kexec_load() system call and
> memory hotplug operations that can lead to a buffer overflow. It adds an
> explicit bounds check to prevent out-of-bounds access when populating
> the memory ranges array.
> 
> Closes: https://sashiko.dev/#/patchset/20260323072745.2481719-1-ruanjinjie%40huawei.com
> 
>> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
>> index fba260ad87a96..df52ac4474c96 100644
>> --- a/arch/arm64/kernel/machine_kexec_file.c
>> +++ b/arch/arm64/kernel/machine_kexec_file.c
>> @@ -59,6 +59,11 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>>  	cmem->max_nr_ranges = nr_ranges;
>>  	cmem->nr_ranges = 0;
>>  	for_each_mem_range(i, &start, &end) {
>> +		if (cmem->nr_ranges >= cmem->max_nr_ranges) {
>> +			ret = -ENOMEM;
>> +			goto out;
>> +		}
>> +
>>  		cmem->ranges[cmem->nr_ranges].start = start;
>>  		cmem->ranges[cmem->nr_ranges].end = end - 1;
>>  		cmem->nr_ranges++;
> 
> While reviewing this commit, I noticed a pre-existing issue in the
> surrounding code.
> 
> Could the error paths in load_other_segments() leak the memory
> allocated by prepare_elf_headers()?
> 
> If a failure occurs later in load_other_segments(), for example when
> adding the initrd or dtb, the function jumps to out_err:
> 
> arch/arm64/kernel/machine_kexec_file.c:load_other_segments() {
> 	[ ... ]
> 		ret = kexec_add_buffer(&kbuf);
> 		if (ret) {
> 			vfree(headers);
> 			goto out_err;
> 		}
> 		image->elf_headers = headers;
> 	[ ... ]
> 	if (initrd) {
> 	[ ... ]
> 		ret = kexec_add_buffer(&kbuf);
> 		if (ret)
> 			goto out_err;
> 	[ ... ]
> out_err:
> 	image->nr_segments = orig_segments;
> 	kvfree(dtb);
> 	return ret;
> }
> 
> The out_err path returns an error but does not free image->elf_headers.
> 
> This seems problematic because the caller in kexec_image.c
> handles placement failures by erasing the segment and retrying in a loop:
> 
> arch/arm64/kernel/kexec_image.c:image_load() {
> 	[ ... ]
> 	while ((ret = kexec_add_buffer(&kbuf)) == 0) {
> 		kernel_segment = &image->segment[kernel_segment_number];
> 		ret = load_other_segments(image, kernel_segment->mem, ...);
> 		if (!ret)
> 			break;
> 	[ ... ]
> }
> 
> Does this retry loop unconditionally allocate new ELF headers on each
> iteration and permanently leak the previously allocated buffers?

It seems this is a bug, and I plan to fix this issue as follows, and
would appreciate your feedback on whether this is reasonable.

Decouple the ELF header allocation from the target-seeking
retry loop. Since the contents and size of ELF headers only depend on
the host memory layout and do not change with the kernel's physical
placement, move prepare_elf_headers() completely outside and prior to
the while retry loop in image_load().

diff --git a/arch/arm64/include/asm/kexec.h b/arch/arm64/include/asm/kexec.h
index 892e5bebda95..cc2f36b1b0d4 100644
--- a/arch/arm64/include/asm/kexec.h
+++ b/arch/arm64/include/asm/kexec.h
@@ -127,7 +127,8 @@ int arch_kimage_file_post_load_cleanup(struct kimage
*image);
 extern int load_other_segments(struct kimage *image,
 		unsigned long kernel_load_addr, unsigned long kernel_size,
 		char *initrd, unsigned long initrd_len,
-		char *cmdline);
+		char *cmdline, void *headers, unsigned long headers_size);
+extern int prepare_elf_headers(void **addr, unsigned long *sz);
 #endif

 #endif /* __ASSEMBLER__ */
diff --git a/arch/arm64/kernel/kexec_image.c
b/arch/arm64/kernel/kexec_image.c
index b70f4df15a1a..79efeaeb71e9 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -44,6 +44,11 @@ static void *image_load(struct kimage *image,
 	struct kexec_buf kbuf = {};
 	unsigned long text_offset, kernel_segment_number;
 	struct kexec_segment *kernel_segment;
+#ifdef CONFIG_CRASH_DUMP
+	/* load elf core header */
+	unsigned long headers_sz;
+	void *headers;
+#endif
 	int ret;

 	/*
@@ -89,6 +94,18 @@ static void *image_load(struct kimage *image,

 	kernel_segment_number = image->nr_segments;

+#ifdef CONFIG_CRASH_DUMP
+	if (image->type == KEXEC_TYPE_CRASH) {
+		ret = prepare_elf_headers(&headers, &headers_sz);
+		if (ret) {
+			pr_err("Preparing elf core header failed\n");
+			return ERR_PTR(ret);
+		}
+		image->elf_headers = headers;
+		image->elf_headers_sz = headers_sz;
+	}
+#endif
+
 	/*
 	 * The location of the kernel segment may make it impossible to satisfy
 	 * the other segment requirements, so we try repeatedly to find a
@@ -99,7 +116,8 @@ static void *image_load(struct kimage *image,
 		kernel_segment = &image->segment[kernel_segment_number];
 		ret = load_other_segments(image, kernel_segment->mem,
 					  kernel_segment->memsz, initrd,
-					  initrd_len, cmdline);
+					  initrd_len, cmdline,
+					  headers, headers_sz);
 		if (!ret)
 			break;

@@ -107,7 +125,7 @@ static void *image_load(struct kimage *image,
 		 * We couldn't find space for the other segments; erase the
 		 * kernel segment and try the next available hole.
 		 */
-		image->nr_segments -= 1;
+		image->nr_segments = kernel_segment_number;
 		kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
 		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	}
diff --git a/arch/arm64/kernel/machine_kexec_file.c
b/arch/arm64/kernel/machine_kexec_file.c
index e31fabed378a..daf81a873bbd 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -40,7 +40,7 @@ int arch_kimage_file_post_load_cleanup(struct kimage
*image)
 }

 #ifdef CONFIG_CRASH_DUMP
-static int prepare_elf_headers(void **addr, unsigned long *sz)
+int prepare_elf_headers(void **addr, unsigned long *sz)
 {
 	struct crash_mem *cmem;
 	unsigned int nr_ranges;
@@ -92,7 +92,8 @@ int load_other_segments(struct kimage *image,
 			unsigned long kernel_load_addr,
 			unsigned long kernel_size,
 			char *initrd, unsigned long initrd_len,
-			char *cmdline)
+			char *cmdline, void *headers,
+			unsigned long headers_sz)
 {
 	struct kexec_buf kbuf = {};
 	void *dtb = NULL;
@@ -105,16 +106,7 @@ int load_other_segments(struct kimage *image,
 	kbuf.buf_min = kernel_load_addr + kernel_size;

 #ifdef CONFIG_CRASH_DUMP
-	/* load elf core header */
-	void *headers;
-	unsigned long headers_sz;
 	if (image->type == KEXEC_TYPE_CRASH) {
-		ret = prepare_elf_headers(&headers, &headers_sz);
-		if (ret) {
-			pr_err("Preparing elf core header failed\n");
-			goto out_err;
-		}
-
 		kbuf.buffer = headers;
 		kbuf.bufsz = headers_sz;
 		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
@@ -128,9 +120,7 @@ int load_other_segments(struct kimage *image,
 			vfree(headers);
 			goto out_err;
 		}
-		image->elf_headers = headers;
 		image->elf_load_addr = kbuf.mem;
-		image->elf_headers_sz = headers_sz;

 		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=0x%lx
memsz=0x%lx\n",
 			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);

> 

