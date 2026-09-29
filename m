Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A744E66AD;
	Tue, 29 Sep 2026 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690018; cv=none; b=av38X6LM4jZzqf1G/KtmU2RSEHpHC7aKiuD6eM3NbH0+mdMVM8aqjoQveH5Nup5DhWeUlzxiEsZF/p24NkAh/NvI6p1gYwbaAyzgKVTMUF11wZTyFkuySD54vTSE+9KxTGFygDiWYwWEyUxXTiA8jR2Kb1HXyTsd8vnob+eH9LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690018; c=relaxed/simple;
	bh=RCZc5l+UwP94XlqAVRmAKFCkp14DeHPCy4UfofZiMuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M8PNCwmyyhVgtYTLlJ531fCJMTpC/Edr8kr20k8hQRtyzygAuCQg4WmTn4ZqnbjMz5WUZLKlHOMYhrkgu/2uST1f4b3YRf1PaDwR79k3Ta2OzC9pQRWSWZm4uNAeRPTaqFBItJ4tc1IwYW8GkR20scelrl2FtnPy26VLuK7SZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H738kUXS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H738kUXS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9CD1F000FF;
	Tue, 29 Sep 2026 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790690016;
	bh=mSFXVkI0lCosHeD9y1J7OJK3oqBZhqiWf5K29e6UckE=;
	h=Date:From:To:Cc:Subject;
	b=H738kUXSQ/crfTKGCP+/e5ewKLgkuSrbbU4dbI1uKJbB2WwGUWg+3prVssBzkH0yX
	 /8vFe8ToyjnIObh/+OONJvz6BwI9q/tlHCVUiEmq0nA7RcuwOgin3tin9xkxEUQVxM
	 btpmj4Xa++Z2Nr9aQ2IjMurySUXRHDT9bhcRubNwze8gGD5ShFrSvzpevLb8YP63Tt
	 4oGj4v4dAwUd6TpsXhEkCLTs7JL3+pe2agfFt9gGjsw2BWLB+TELkJNHkgmc2DnTx+
	 93Iq3Qji0Ga1M/c7dNErE6EUdzOSGvchBAHcAC7CnxM+qzkegJ4/AsKerH1Xr7lW47
	 IK0WObjMlXl9w==
Date: Tue, 29 Sep 2026 14:53:32 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev
Subject: addressing sashiko's false positive rate
Message-ID: <arvCuOARoB9LvQqY@gremlin>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zmzjlkhwbafjxkxy"
Content-Disposition: inline


--zmzjlkhwbafjxkxy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[adding forgotten sashiko ML to cc's oops!]

Hi Roman, Sashiko team,

I gave some feedback about false positives at [0], but I thought I'd expand on
that and give some solid data.

To be clear at the outset - my intent here is to be constructive, I feel that
sashiko's false positive rate can be improved and I hope this analysis helps in
that regard.

I've done analysis on that series [1], my build speed up series [2], and my
kvmarm prefault series [3].

Series [1] is 39-40 patches over 3 postings, [2] is 20-23 patches over 4
postings and [3] is 8-14 patches over 4 postings.

This should give at least a reasonable amount of data to work with.

I had AI check through them (I find a frontier model + review-prompts is very
good at assessing sashiko reports), cross-referencing the changes that were
taken and reasoning given, and then went through the verdicts by hand.

You state in the README:

"The rate of false positives is harder to measure, but based on limited manual
reviews it's well within 20% range and the majority of it is a gray zone."

I both disagree with that number and feel that there very much are better ways
of determining false positives. More on that below.

Analysing the series:

Summary, unique findings (duplicates removed)
---------------------------------------------

  Series    Unique  Useful  Wrong   Useful%
  1           36      20     16       56%   (1 v1 alone: 17 unique, 71%)
  2           36      17     19       47%   (2 v1 alone: 18 unique, 61%)
  3            3       1      2       33%
  Total       75      38     37       51%

'Useful' here means the report was correct, whether the issue was in the
series or pre-existing in code it touched. 'Wrong' means the claim does not
hold against the code, or holds only under a precondition nothing in-tree
meets (a driver violating a documented contract, an unsupported build host,
an OOM-only error path) - those were rated High or Critical as often as not,
so I count them as false positives.

This matches my intuition that I've expressed to you in-person and on-list that
the false positive rate is ~50%.

I've heard people say this was limited to mm specifically, but now I've seen
this pattern across 3 subsystems (mm, kvmarm, kbuild) so I feel it's more
generalised.

What concerns me here is that the rate doesn't seem to have improved over time,
which makes me think it's less a model issue and more sashiko needing to be
sharper at dismissing false positives.

The per-posting numbers are also interesting:

Unique findings by posting (duplicates within and across postings removed)
--------------------------------------------------------------------------

  Series  Posting   Raw  Dup  Unique  Useful  Wrong   Useful%  Wrong%
  ------  -------   ---  ---  ------  ------  -----   -------  ------
  1 mm    v1         24    7      17      12      5       71%     29%
  1 mm    v2         17    2      15       8      7       53%     47%
  1 mm    v3          9    5       4       0      4        0%    100%
  ------  -------   ---  ---  ------  ------  -----   -------  ------
  2 kbld  v1         20    2      18      11      7       61%     39%
  2 kbld  v2         11    5       6       3      3       50%     50%
  2 kbld  v3         15    9       6       3      3       50%     50%
  2 kbld  v4         12    6       6       0      6        0%    100%
  ------  -------   ---  ---  ------  ------  -----   -------  ------
  3 kvma  v1          0    0       0       -      -         -       -
  3 kvma  v2          3    1       2       0      2        0%    100%
  3 kvma  v3          1    0       1       1      0      100%      0%
  3 kvma  v4          0    0       0       -      -         -       -
  ------  -------   ---  ---  ------  ------  -----   -------  ------
  Total             112   37      75      38     37       51%     49%

As you'd expect, the real issues are fixed on respin.

However, what's interesting is the continued false positive rate that
remains: the number of wrong reports per posting stays roughly constant
(5, 7, 4 for mm and 7, 3, 3, 6 for kbuild) while the real issues run out,
so on the final posting of each series everything emitted was wrong.

This is good evidence for there being a problem with sashiko's verifier -
these numbers are de-duplicated across revisions - so it is allowing
arbitrary new invalid reports through on each occasion.

Severity is an interesting breakdown also:

By severity, raw, all series combined
-------------------------------------

  Severity  Findings  Useful  Wrong  Duplicate  Useful%  Useful% unique
  Critical      4        3      0       1        75%       100%
  High         53       18     18      17        34%        50%
  Medium       27       11     11       5        41%        50%
  Low          28        6      8      14        21%        43%

Every 'critical' was a real bug (barring the duplicate). Below that it's
a coin flip regardless of severity, so the severity label isn't currently
usable as a confidence signal.

What helps bring this together is that the API exposes the candidate
concerns the verifier dismissed for each posting, alongside what it emitted:

Candidates generated vs. emitted vs. useful
-------------------------------------------

  Posting   Candidates dismissed   Emitted   Useful   Useful / all candidates
  1 v1            287                24        12          4.0%
  1 v2            275                17         8          2.8%
  1 v3            276                 9         0          0%
  2 v1            162                20        11          6.0%
  2 v2            158                11         3          1.8%
  2 v3            138                15         3          2.0%
  2 v4            151                12         0          0%
  3 v1             89                 0         0          0%   (not sent)
  3 v2            123                 3         0          0%
  3 v3            116                 1         1          0.9%
  3 v4            138                 0         0          0%
  ------------------------------------------------------------------------
  Total          1913               112        38          1.9%

So the emailed reports are already the ~5% of candidates that survived
internal verification, and roughly half of those survivors are still
wrong. This helps back up the idea that the verifier is not quite doing its
job properly, in line with the per-posting numbers above.

The model doesn't seem to be the issue: I raised a ~50% hit rate just over
6 months ago ([4]), and the API shows that series was reviewed by the same
model, gemini-3.1-pro-preview, as every posting analysed here.

Also on that - I gathered from previous discussions that model improvement
was being leaned upon for accuracy improvements moving forwards. Has the
model behind that version string actually changed over the six months, or
has it been identical throughout?

If the latter, is there any intention to upgrade it over time? If the
former, the data above suggests it hasn't moved the false positive rate.

Also it seems the newer prompt versions didn't do much to address the issue
as below:

Prompt versions
---------------

  Posting     Date     Model                    Prompts
  ----------  -------  -----------------------  -------
  kvmarm v1   25 Aug   gemini-3.1-pro-preview   0.3.3
  mm v1        8 Sep   gemini-3.1-pro-preview   0.3.3
  kbuild v1    8 Sep   gemini-3.1-pro-preview   0.3.4
  mm v2       14 Sep   gemini-3.1-pro-preview   0.4.0
  kbuild v2   14 Sep   gemini-3.1-pro-preview   0.3.4
  kvmarm v2   14 Sep   gemini-3.1-pro-preview   0.3.4
  mm v3       17 Sep   gemini-3.1-pro-preview   0.4.0
  kbuild v3   17 Sep   gemini-3.1-pro-preview   0.4.0
  kvmarm v3   22 Sep   gemini-3.1-pro-preview   0.4.0
  kbuild v4   23 Sep   gemini-3.1-pro-preview   0.4.0
  kvmarm v4   23 Sep   gemini-3.1-pro-preview   0.4.0

So all this I think has a positive edge to it - by improving the verifier
we can probably improve the false positive rate.

Some suggestions:

1. Sample a random subset of series authors to assess which of the reports
   sent were considered accurate. This is a good methodology for actual false
   positive rate.

2. Do the same, only for a random set of _dismissed_ candidates - check to
   see if anything good is being thrown out. Only you can do this one, as
   the dismissed candidates and the verifier's reasoning are in your records
   but never sent to anybody.

3. You could even get a weak signal from detecting whether code at the report
   site was altered or not, that wouldn't require voluntary input.

It feels like step 1 could be really useful for honing/training the verifier to
be more accurate.

A couple of requests:

1. An ability to mark something as a false positive so this data can proactively
   be provided to you to help improve things.

2. An ability to mark reports as 'rejected' so they are not re-emitted in each
   respin, it's a real issue at the moment: a third of everything emitted
   across these 11 postings was a repeat, and on later postings the repeats
   plus new false positives are all there is.

It'd be nice to update that section in the README about the false positive
rate, though if so it's important to define what counts as a false positive
and which denominator is being used (unique reports, total reports, etc.).

That can wait on potentially retrieving more data on this though.

I enclose CSV output for data relating to the 3 series above for reference,
one row per emitted report with the verdict and the reason for it too.

[0]: https://lore.kernel.org/sashiko/araV69I3WLn9I_Nu@gremlin/
[1]: https://lore.kernel.org/all/20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org/
[2]: https://lore.kernel.org/all/20260923-build-speedup-v4-0-73128809a4a4@kernel.org/
[3]: https://lore.kernel.org/all/20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org/
[4]: https://lore.kernel.org/all/3d6cca25-75ff-434a-b210-114451f8dbaf@lucifer.local/

--
Cheers, Lorenzo

--zmzjlkhwbafjxkxy
Content-Type: text/csv; charset=us-ascii
Content-Disposition: attachment; filename="sashiko-mm-findings.csv"

version,patch,severity,claim,verdict,note
v1,01,High,file reference leak when file swapped and mapping merged,valid-acted,v2: new patch 1 with put_map()
v1,01,High,file reference leak in call_mmap_prepare() error paths after swap,valid-acted,same fix
v1,03,High,corrupted vm_start left in place on validation failure so cleanup unmaps wrong range,valid-acted,v2: restore vm_start before teardown
v1,03,High,mmap_prepare_validate() failure leaks driver resources and file ref,valid-acted,file ref part fixed by put_map(); resources part not actionable (no VMA yet)
v1,03,High,same leak in __compat_vma_mmap(),duplicate,
v1,04,High,file leak on validation failure after file replacement,duplicate,same as patch 1
v1,07,Low,dup.h missing map_kernel_discontig member,valid-acted,v2: mirrored
v1,08,High,PAGE_SIZE * nr_pages overflow in end calculation,wrong,trusted driver input; mirrors existing code
v1,08,High,bounds check does not handle huge nr_pages,wrong,same
v1,08,High,infinite loop if nr_pages is 0,valid-acted,v2: reject zero batch
v1,10,High,hfi1 PIO_BUFS clears VM_MAYREAD but not VM_READ,valid-acted,pre-existing; series validation covers it
v1,10,Medium,RTAIL loses VM_DONTEXPAND via dma_mmap_coherent() on IOMMU path,valid-acted,v2: VM_DONTEXPAND set
v1,10,High,hfi1 EGRBUF clears VM_MAYWRITE but not VM_WRITE,valid-acted,as above
v1,12,High,ALSA vm_insert_page() uses stale vm_page_prot granting write,valid-acted,v2: recompute vm_page_prot
v1,15,High,file leak when driver replaces desc->vm_file and validate fails,duplicate,same as patch 1
v1,18,High,fb_deferred_io_mmap() NULL deref if init failed,valid-out-of-scope,pre-existing ssd1307fb; separate fix
v1,18,High,ssd1307fb_probe() ignores fb_deferred_io_init() return,duplicate,same issue
v1,23,High,mlock_count leaked on concurrent unmap,valid-acted,v2: munlock_vma_folio() tests VMA_LOCKED_MASK
v1,23,High,concurrent rmap walks skip munlock while VMA_LOCKED_BIT cleared,duplicate,same issue
v1,24,Medium,WARN_ON_ONCE reachable by unprivileged user is a DoS under panic_on_warn,wrong,requires buggy driver; standard kernel practice
v1,24,High,resource leak in call_mmap_prepare() on validation error,duplicate,same as patch 1
v1,24,High,double free when mmap_file() fails after file swap,duplicate,same family
v1,32,High,MADV_WIPEONFORK uses vm_file to classify anonymous VMAs,wrong,stale against base; private /dev/zero already anonymous
v1,32,High,__MADV_SET_ANON_VMA_NAME same,wrong,same
v2,04,High,restoring vm_start before unmap_region() orphans PTEs,wrong,restoring is the only sane choice; lowered start would be another VMA's range
v2,04,High,vma_close() before unmap_region() leaves UAF window,valid-acted,dismissed as unreachable in v2; independently confirmed by a human reviewer on v3; fixed in v4
v2,04,High,no check for VM_WRITE set without VM_MAYWRITE,wrong,hardening idea presented as exploit; no driver does it
v2,04,High,vm_end not validated,valid-acted,v3: symmetric end check added
v2,05,Critical,map->vma_flags copied before call_action_prepare() so PFNMAP/IO lost,valid-acted,the real bug; also found by mm-ci bisect three days later
v2,08,High,discontig_kernel_map_page() maps from folio head when given a tail page,wrong,documented contract plus VM_WARN
v2,08,Medium,ops->init() state leaks on error,wrong,contract documents release via vm_ops->close
v2,08,Low,NULL ops dereferenced before WARN,valid-acted,v3: guard added
v2,08,High,apply_discontig_action() maps from folio head (restated),duplicate,second block for the tail-page issue
v2,11,High,remap_vmalloc_range() requires the vmalloc base address,wrong,find_vm_area() is a range lookup
v2,14,High,bpf arena zap_pages() walks unstable mm,wrong,pre-existing and incorrect; maple tree consistent under mmap_read_lock
v2,16,Critical,same vma_flags ordering bug reported on patch 16,duplicate,same as patch 5
v2,17,Low,dup.h vma_flags_can_merge() not updated to use is_fixed_mapping,valid-acted,v3: mirrored
v2,19,Critical,ssd1307fb passes virtual address to __free_pages(),valid-out-of-scope,real pre-existing bug; separate fix
v2,19,High,ssd1307fb ignores fb_deferred_io_init() return,valid-out-of-scope,repeat of v1 in effect; separate fix in progress
v2,19,High,ssd1307fb i2c id table lacks driver_data,valid-out-of-scope,plausible NULL deref on sysfs instantiation; unverified
v2,24,Low,casting bool to void * warns,wrong,verified no warning with gcc or clang under -Wall -Wextra
v3,01,High,vma->vm_file NULL in compat_set_vma_from_desc() when VMA anonymised,wrong,path only reachable from a file's own mmap hook
v3,01,High,same NULL on the success path,duplicate,second block for the same claim
v3,04,High,vma_close() before unmap_region() UAF window,duplicate,repeat of v2 (valid)
v3,04,Medium,resources allocated in mmap_prepare never closed on validation failure,wrong,no VMA exists yet; pre-existing behaviour on every such failure
v3,04,Medium,file reference leak after hook swaps file and validation fails,wrong,put_map() at the abort label drops it
v3,04,Medium,validation failure in call_mmap_prepare() skips close (restated),duplicate,second block for the compat-layer claim
v3,08,High,discontig_kernel_map_page_range() page array read after get hook returns (stack UAF),wrong,true of the API but no caller exists; doc note at most
v3,08,High,apply_discontig_action() dereferences the stale array (restated),duplicate,second block for the same claim
v3,24,Low,bool to void * cast warns,duplicate,repeat of v2 (wrong)

--zmzjlkhwbafjxkxy
Content-Type: text/csv; charset=us-ascii
Content-Disposition: attachment; filename="sashiko-kvmarm-findings.csv"

version,patch,severity,claim,verdict,note
v1,-,-,no findings emitted (8 patches reviewed; 89 candidates dismissed; nothing emailed),-,
v2,01,Low,esr_trap_is_iabt() ignores ESR_ELx_EC_IABT_CUR so a future host-fault caller could misuse it,wrong,mirrors the KVM vCPU wrapper it replaces; stage-2 helpers only see LOW; the review itself says current use is safe
v2,01,Low,esr_abt_is_exec_fault() inherits the same,duplicate,
v2,06,High,pkvm_mem_abort() lacks the mmu_invalidate_seq retry protocol,wrong,pre-existing pKVM code the patch touches on one line; pKVM pins the page before mapping by design
v3,07,Medium,kvm_guest_s2_mapping allocation gated on vcpu->arch.hw_mmu while the pgt uses s2fd->mmu so pre-fault on a nested vCPU allocates spuriously,valid-acted,v4: gate on s2fd->mmu (credited to Fuad who wrote "Sashiko might be right about this one")
v4,-,-,no findings emitted (14 patches reviewed; 138 candidates dismissed; 14 "no issues" mails sent),-,

--zmzjlkhwbafjxkxy
Content-Type: text/csv; charset=us-ascii
Content-Disposition: attachment; filename="sashiko-speedup-findings.csv"

version,patch,severity,claim,verdict,note
v1,04,Medium,kallsyms fopen "w" not "wb" corrupts on MinGW,wrong,kernel builds require a POSIX host; repeated v4 p3
v1,06,Low,--emit-relocs only on final link breaks riscv relaxation/kallsyms,wrong,riscv passes --no-relax to every vmlinux link; repeated v2 p5
v1,11,Medium,st_mtim breaks macOS host build,wrong,macOS is not a supported build host; repeated 5 more times
v1,11,Medium,st_mtim (second site),duplicate,same as above
v1,11,High,fwrite() unchecked in write_without_deps,valid-acted,v2: check ferror() before close
v1,11,High,fclose() insufficient to catch earlier write errors,duplicate,same fix as previous
v1,15,Critical,__this_module emission order breaks under CONFIG_RANDSTRUCT,valid-acted,v2: emit fields in offset order
v1,16,High,seq not POSIX so modfinal-chunks empty,wrong,seq universal on build hosts; empty chunks are silently a no-op anyway; repeated v3 p14
v1,16,High,empty modules.order gives make syntax error,wrong,tested: empty target list is accepted and nothing to finalise
v1,17,High,read_text_file() infinite loop / no buf advance on short read,valid-out-of-scope,pre-existing modpost code; patch dropped in v2
v1,17,Medium,concurrent warn() interleaves stderr,valid-out-of-scope,true but cosmetic; patch dropped in v2
v1,19,Medium,insn_hash never freed,valid-acted,v2: freed
v1,19,High,objtool_pv_add() list_add races across threads,valid-acted,v2: lock around pv_ops
v1,19,Low,realloc() failure leaks decode_ranges,wrong,tool exits on the error; repeated v2 v3 v4
v1,19,Medium,mark_sec_changed() races in threaded add_call_destinations,valid-acted,v2: call destinations resolved serially
v1,19,Low,early return skips free_decode_ranges(),wrong,tool exits; repeated v2
v1,20,Medium,-j8/-Zthreads=8 ignores make -j1 memory limits,valid-acted,v2 made opt-in (credited to humans); dropped v3
v1,22,Medium,ifeq MAKECMDGOALS exact match fails with multiple goals,valid-acted,v2: filter
v1,23,Medium,KGZIP := overrides user environment,valid-acted,v3: KPGZIP with KGZIP = gzip restored
v1,23,High,pigz thread explosion under parallel modules_install,valid-acted,v2 modules use gzip; v3 pigz via jobserver
v2,05,Low,riscv relaxation (repeat),duplicate,
v2,09,Low,st_mtim (repeat),duplicate,
v2,09,Low,target_of() name_len underflows for a bare ".cmd",valid-acted,v3: hardened against empty name
v2,09,Low,st_mtim (repeat second site),duplicate,
v2,09,Low,ferror() || fclose() short-circuit leaks the FILE,wrong,fatal error path of a short-lived tool; repeated v3
v2,14,Medium,.module-common.o rule visible to every chunk child,valid-acted,v3: only top-level instance builds it
v2,17,Low,realloc leak (repeat),duplicate,
v2,17,Low,early-return leak (repeat),duplicate,
v2,20,Medium,KBUILD_RUST_DIRS order-only dep bypassed for arch/x86,wrong,hypothetical; no arch rust directories exist
v2,20,Medium,make all modules_prepare builds rust/ twice concurrently,valid-acted,v3: skip when a tree-building goal is present (credited to Kees)
v2,20,Medium,rust-dir-ok firstword rejects arch/x86,wrong,same hypothetical as above
v3,01,Low,sed comment removed while sed still needed,valid-out-of-scope,fair nit; v4 removed the sed entirely
v3,07,Medium,System.map fclose() without ferror(),valid-acted,v4: ferror() before close (credited to Kees)
v3,07,Medium,same at second site,duplicate,
v3,09,Low,st_mtim (repeat),duplicate,
v3,09,Low,st_mtim (repeat),duplicate,
v3,09,Low,ferror short-circuit (repeat),duplicate,
v3,11,Low,Kconfig cc-option accepts unknown -Wno-* flags,valid-acted,v4: probe positive form (credited to kernel robot; Sashiko was first)
v3,11,Low,same for -Wno-packed-not-aligned,duplicate,
v3,14,High,seq missing (repeat),duplicate,
v3,15,High,reloc cache windows initialised to 0,wrong,true of the code; only trailing offsets past the last reloc scan linearly; negligible
v3,15,High,init_reloc_cache leaves tail windows at 0,duplicate,same issue
v3,15,High,trailing lookups fall back to linear scan,duplicate,same issue
v3,16,Medium,free_insns() on early decode failure walks a NULL insn_hash,wrong-but-technically-right,reachable only if cfi_hash_alloc/init_pv_ops/classify_symbols fail; one-line guard; repeated v4 p18
v3,17,Low,realloc leak (repeat),duplicate,
v3,17,Medium,mark_sec_changed race in threaded jump destinations,wrong,benign write of true; Sashiko says so itself
v4,01,Low,--dump-section fails when .modinfo absent (tinyconfig),wrong,unverified but robot-tested across four versions; built-in MODULE_LICENSE tags keep the section
v4,03,Low,"wb" (repeat),duplicate,
v4,12,High,cc-option-str undefined so CET flags dropped,wrong,series depends on Kees's cc-option-str series as the cover states
v4,12,High,same for -fzero-init-padding-bits,duplicate,
v4,12,High,same for ld-option-str,duplicate,
v4,17,Low,compare_reloc_order returns 1 for identical elements,wrong,nit; qsort never compares an element with itself in practice
v4,17,Medium,trailing windows linear scan (repeat),duplicate,
v4,17,High,unsorted path returns 0 causing endless rebuilds,wrong,index rebuilt once under lock and sorted set true
v4,18,Medium,NULL insn_hash (repeat),duplicate,
v4,19,Low,realloc leak (repeat),duplicate,
v4,19,High,double-checked sorted flag set before cache populated,wrong-but-technically-right,dropped indexes are only rebuilt outside the threaded phase; moving sorted=true after the loop closes it
v4,21,Medium,make modules_prepare tar-pkg races on rust/,wrong,nonsensical goal combination

--zmzjlkhwbafjxkxy--
