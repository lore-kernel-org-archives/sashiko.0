Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF711ADC83;
	Sun, 31 May 2026 00:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780187922; cv=none; b=Xua4wvOOcBZ4RzxyIoUleQuyRGJ52m5nJ4Xtv6R969UWtTVbaLEwCRXTtKIw6zkJTJRQ4uI/tIwqLBO90wCU8LcdY2xU/fBhMUrgrLchbPGN7CMNbZ98XkJcESJ9baHzZ6xesDVB2bR4FERaX5ndzAWPViXijae/PgoWkkd9XjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780187922; c=relaxed/simple;
	bh=rnu7wZR9x2neEh4rUjPwUVPOlU1lUSHvSQ24W7AE/ts=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=UCJtEAReBjnRNA25/79zm82PmIcDF2weltUISHuQXwTAZbqEF1b9Bz1jBa1TDBVlB2QBc8rUv2ZFMj3fVidEx9pn6Xnpddp6T5RG9vLaZksC9WLmO/nsvhBMOH8P4GuNnle9joumC7GUbhX7YXklg1uW47Em+nra2UJPL2U01Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imR/M1Tz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imR/M1Tz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3211F00893;
	Sun, 31 May 2026 00:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780187920;
	bh=ymyhzMDISc+MMKltA5c65XdEtBntFs+bkMDLRCi9mxs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=imR/M1Tz3aH7Q1VgERPGGyacEwQlBXcLbe3qq3GGWADoitMmZi97fT4dtRc6eylz8
	 JxOZgUrHwg3arzsYyB48ME2z7Z8SHQKqw4MYmNRoKxofZUwJSmdlqbkQ7QRCROWV80
	 VfHZ4dhvbT1QeFwEN97iMFagYZ2ZgFPo8kjt0V7gRbwoUx5fjT2abwdz/zsN2oN5gB
	 wuyRL3cc9cumKk6T5bkyuKTPUQTrNI2fVyzZXg+EqERc6Ll3OPwBEeNauxgmasFUnG
	 O7yClVHEA3fA7mWP/CUVkHfbotlZobXmfSFLBbnum9SSY8ifLY7st41/FS1y2XVEZ5
	 ZoLWmivXyNafA==
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v13 4/5] media: qcom: camss: csid: Add support for CSID
 gen4
From: bod@kernel.org
To: sashiko@lists.linux.dev
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, conor+dt@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260508212213.ED319C2BCB0@smtp.kernel.org>
References: <20260508-kaanapali-camss-v13-4-2541d8e55651@oss.qualcomm.com>
 <20260508212213.ED319C2BCB0@smtp.kernel.org>
Date: Sun, 31 May 2026 01:38:37 +0100
Message-Id: <178018791720.17481.10983668954574740501.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=7494; i=bod@kernel.org;
 h=from:subject:message-id; bh=rnu7wZR9x2neEh4rUjPwUVPOlU1lUSHvSQ24W7AE/ts=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqG4MO9lxWBkHRgCrz/pOdETefZdMSijXQDPqu2
 +5UBGjWDbOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahuDDgAKCRAicTuzoY3I
 Ot30D/4gOXcXPvXqULYtTribkQQwloXnC52VD57lLlTkK8LhHUQWm8IVDaiRCSn8OVipIXJQt8G
 RFlDzOgoP3oJb59Nm2TlToeVef34FGtsRmIgv6yTYKwsE3tUPu2rEfFYAMmaSrCj8/9Gu+DuF0p
 kAgLdK6uj599ukhdH39ty2WQRxMlVx+B9e8h1cfl8q2wEiI0dlMsfxdnJk+jxScw3KQmDHNKiBL
 NAculvL8buKkOFQf96HXteQ4RdC1n3zw9AiFCWUmXtfjiGTh0b4TwaiKsj6yxPmgJsxM9sI1oDk
 aSoNzvvdsHNvXlgK6IQ18sd/0yLri1lvFTjmkoH87DfmJhzxa2flZLU0HWzQPWJR52OQ4BniXDH
 A8fyT/U+pSY043+fAhiYC8FmdXlOW4u/JPRmlXayPGiKgN9k7q1/15uHZLnZMizEvAYTdR1pXEv
 qLKJLPM3aSlaA4owxP1NPV9Wh9CSNxey52vz2mgdq9TLfFF/mFK9ec/g8qqxo6wrB+GJozI3Cgq
 E02+aVnLG90p83YV45q1HmdqECXtOezH+M1+So4I8THki83zK4mBs5ron+La19n3ZbMgBy88obv
 6/ttcAz0eVF+ki7rbi4Dpr+DmOVUiwftfiSdd/t+JnUYYInZ8Iergzb/yL0jz8MQN1vt8NPhFMv
 6ory2ip0cmvgnrw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-05-08 21:22 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Hardcoded virtual channel (VC) parameter breaks multi-VC support and leaves dead code.
> - [High] Out-of-bounds array access on `csid->fmt` when configuring the 5th stream.
> - [High] Concurrent read-modify-write on shared hardware update state without locking.
> - [High] RDI and RUP_DONE interrupts are permanently masked, causing hardware update states to drift.
> - [Medium] Integer underflow in `__csid_configure_rx()` when `lane_cnt` is zero causes severe register corruption.
> - [Low] Meaningless back-to-back hardware command triggers due to redundant loop.
> --
> 
> commit ac71c3367c14093dee35b321f0ec55ce9cc5f586
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> media: qcom: camss: csid: Add support for CSID gen4
>     
> Add more detailed resource information for CSID devices along with the
> driver for CSID gen4 that is responsible for CSID register configuration,
> module reset and IRQ handling for BUF_DONE events. And aggregate a common
> definition CSI2_RX_CFG0_PHY_SEL_BASE_IDX into csid header file.
>     
> In this CSID version, RUP and AUP update values are split into two
> registers along with a SET register. Accordingly, enhance the CSID
> interface to accommodate both the legacy combined reg_update and the
> split RUP and AUP updates.
>     
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> [ ... ]
> 
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
> > new file mode 100644
> > index 0000000000000..41035352c4bb0
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
> > @@ -0,0 +1,376 @@
> 
> [ ... ]
> 
> > +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
> > +{
> > +	/* Hardware clears the registers upon consuming the settings */
> > +	csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
> > +	csid->rup_update &= ~CSID_RUP_AUP_RDI(port_id);
> > +}
> 
> The variables csid->aup_update and csid->rup_update track global hardware
> update bits and are modified via non-atomic operations here and during
> stream configuration.
> 
> Since these are accessed from both process context and ISR context, could a
> race condition occur where an interrupt firing during a read-modify-write
> cycle corrupts the shadow states, silently dropping AUP/RUP commands for
> other active ports?

Possibly.

Worth checking and flagging, there's no need to start introducing
additional locks just for this SoC since this is a pattern we have not a
SoC specific thing.
 
> [ ... ]
> 
> > +static void __csid_configure_rx(struct csid_device *csid,
> > +				struct csid_phy_config *phy)
> > +{
> > +	int val;
> > +
> > +	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> 
> If phy->lane_cnt is 0, will the subtraction underflow to 0xFFFFFFFF?

lane_cnt != 0 is validated long before here.
 
> This would result in writing all 1s to the register, potentially causing
> hardware misconfiguration.
> 
> There is a fallback condition explicitly handling a 0 lane count in
> __csid_configure_rdi_stream(), which sets lane_cnt to 4 if it is 0.
> Should a similar check be added here?
> 
> [ ... ]
> 
> > +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
> > +{
> > +	u32 val;
> > +	u8 lane_cnt = csid->phy.lane_cnt;
> > +
> > +	/* Source pads matching RDI channels on hardware.
> > +	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
> > +	 */
> > +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
> 
> The macro MSM_CSID_MAX_SRC_STREAMS_GEN4 evaluates to 5 for non-lite CSID
> hardware, meaning the loop index port can reach 4.
> 
> Since MSM_CSID_PAD_FIRST_SRC is 1, MSM_CSID_PAD_FIRST_SRC + port evaluates
> to 5.

That's worrying.

Would appreciate some follow-up from patch authors on this one "yes we
looked no that can't happen" "yes we looked no it can't happen"

Either is acceptable.

> However, the csid->fmt array is sized by MSM_CSID_PADS_NUM, which remains
> hardcoded to 5, meaning valid indices are 0 through 4.
> 
> Can this result in an out-of-bounds memory read when attempting to process
> the 5th stream?
> 
> [ ... ]
> 
> > +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> > +{
> > +	u8 i, k;
> > +
> > +	__csid_configure_rx(csid, &csid->phy);
> > +
> > +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_GEN4; i++) {
> > +		if (csid->phy.en_vc & BIT(i)) {
> > +			__csid_configure_rdi_stream(csid, enable, i, 0);
> > +			__csid_configure_rx_vc(csid, 0);
> 
> The functions __csid_configure_rdi_stream() and __csid_configure_rx_vc()
> are invoked with a hardcoded 0 for the vc argument instead of passing the
> actual virtual channel or the loop index i.
> 
> Does this force all enabled streams to capture Virtual Channel 0, breaking
> the driver's ability to handle multiple virtual channels?

No, the driver's ability to handle VCs isn't there.
 
> Additionally, passing 0 to __csid_configure_rx_vc() makes the internal
> condition if (vc > 3) always evaluate to false. Is this code intended
> to be reachable?
> 
> > +
> > +			for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++)
> > +				__csid_aup_update(csid, i);
> 
> CAMSS_INIT_BUF_COUNT is intended for ping-pong buffer queues in the VFE.
> Since CSID does not manage memory buffers, this loop repeatedly triggers
> identical AUP commands to the hardware without any intervening state
> changes.
> 
> Is it necessary to repeatedly trigger these commands here?
> 
> [ ... ]
> 
> > +static irqreturn_t csid_isr(int irq, void *dev)
> > +{
> > +	struct csid_device *csid = dev;
> > +	u32 val, buf_done_val;
> > +	u8 reset_done;
> > +	int i;
> > +
> > +	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
> > +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> > +
> > +	reset_done = val & INFO_RST_DONE;
> > +
> > +	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
> > +	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> > +
> > +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_GEN4; i++) {
> > +		if (csid->phy.en_vc & BIT(i)) {
> > +			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> > +			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> > +
> > +			if (val & INFO_RUP_DONE)
> > +				csid_subdev_reg_update(csid, i, true);
> 
> The macro CSID_CSI2_RDIN_IRQ_MASK is defined in the source but never written
> to hardware.
> 
> Additionally, in csid_reset() below, only INFO_RST_DONE and
> BUF_DONE_IRQ_STATUS are unmasked in CSID_TOP_IRQ_MASK.
> 
> Without unmasking CSI2_RX_IRQ_STATUS at the top level and writing to
> CSID_CSI2_RDIN_IRQ_MASK, will the INFO_RUP_DONE interrupt ever fire?

Reset is 0xFFFFFFFF.
 
> If this interrupt is permanently masked, __csid_aup_rup_clear() won't be
> called, which might cause the software cache of the hardware triggers
> to permanently drift out of sync.
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com?part=4
> 


