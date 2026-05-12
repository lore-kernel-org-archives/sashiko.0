Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022078.outbound.protection.outlook.com [40.107.75.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50E6368D7B
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 07:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569405; cv=fail; b=u2Uv3wRQ+KF8rt3ESFMC/2kNeHnDvRoDs2tBa419y7cpBwV/zl1XWhBDtaI81fXeTy0clD3gdsyps3YGle+fPifVfjWxEp5NtoRq9C8zfhZM7ZVxQVafCyfD4J4v2vdAVSJWEF4RcRxWmwRqMzNeFuc8GM2x/aiPGGyptpKDW4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569405; c=relaxed/simple;
	bh=rhajQpPRgpzkUEisfsLfB842D7rj+IZ1wgzOSrNXQMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5p8CMml0/tfa+uDDZU/TQoFdBupeuHdsYSAsGaXbD7cKrfT7NCB1tgQT4+qA4Jbfw0iKelqQ5XvM2JFQhJwDM5GsFkLyXhbyKz1im4S7ohhINP56JWtANbIYtVflyxPqRY55aCGlSjk0RxS5xhFld5qAm46pYnwZqFNoxDRJio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmVAuZNDOTtf52AQ2+LuXTvMyfJZzYibWrWYv3fmZs9gDZInkY0rYM5R3xl3Xoxla4MRt+T2rUVTF9Vo642lhhVqaRCocE/2AoScSFqiRbGk9rpuzLSKLq3tYXmH84DsoAzmOpo+MGrz7BQJphhRuLL2rtOZo4DB3Y2A6ZeWFPA3QSAH9xLykKzxTvMwXH1/tO02AG1GuG0xeQdgLd7ewyycgEWEhCF2OcEcpwqG0+xTwoh3G2FO/Vn0LMGoLLUMIrZCM7eUBCx0kenFNOC8ha0v/J3rgN3jmo7p5F+qYkRHbQ8tMFAVOuhS+197+EtKlXw3EVU2N9vsVwG1qYYNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSMGU1m5YxERnFRSL2fqaYHMDQ8GygXs0jsooy5SeXc=;
 b=rbMSSX382f3TejUUo2pzL5JHKxOuqugJCLCR/5Ht1t5Qf5BbncKidz4xgovzKu2gsZcxFF0z1SS+pIwgg6lrtVXfUdG/IHW0pyqlIoWshhI2Ep1ZcQOyz1ft649z8JnS+7+f9jvFMjrBkhv+79MA8l31D1P5NfrVd4I95KDTq9MgQ0SgnIhVXhQDqpdeThliEZIgEkTA4DUPgLVX7xG1Ey6mSru4e7K0sIGZH5wCBQKHg6hvcXxzDuoFEGr5vpg3Oo2t13pVl841d09pgVIJnP1B7XOPWY8r12k2ytbmBaaGkrWpwK/wh965m7NO2P2V7ZQCCrRZ6DqLSzHnnxXEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::17) by SEYPR06MB8065.apcprd06.prod.outlook.com
 (2603:1096:101:2d6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 07:03:17 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:300:2d:cafe::17) by PS2PR01CA0005.outlook.office365.com
 (2603:1096:300:2d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 07:03:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 07:03:16 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A77A841609D5;
	Tue, 12 May 2026 15:03:15 +0800 (CST)
Date: Tue, 12 May 2026 15:03:14 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: sashiko@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] usb: cdns3: plat: Expose platform core driver as
 library
Message-ID: <agLQst47wI/vC3pp@nchen-desktop>
References: <20260511024244.981941-2-peter.chen@cixtech.com>
 <20260511230233.B40E6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511230233.B40E6C2BCB0@smtp.kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|SEYPR06MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: bd6d669a-2503-4cbe-12eb-08deaff48b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|3023799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/tjdQZ90mVkfnVgxxLx17goLq+S0LsZyiT8i9daJ8Dnr5FABmRMegAM3QeIjB8CQAyZwQujOsRXzws/53HKm6HaZvM+CmultBMg7TbUfE4gWtrEpwG18M8f3B5yrw1PkYnjvHyIzJ62WRHKc5wxhQLTaOsBch9PCcmHLW62rARidWTxsmOdyvJZ+QVRqUBd1p/EAzUyMjgYzvGzINKGTe+EotMxtekxnS1DT4ijjldeJ6GIwKNkuqRcdM6LePhuF81k37071h17w/5uDVKMPopwHQ+e8LgNFJGWt8PHqHIGEbCxxqeDAx/lWoy3T2aDfibXvoqWb8uMNCy4drDXedXcKsO3y/7YFNUJCuqdk1aqlG9cz8+aScM9UW2fJCMebllAItaL/WVJD31ggmk435qPi12n9u9BESSXA5hDJ5jjsnB9adSbBYx5UzFmM199aoC1VQrWi+ZcIGza7r0px7AaARkRz9HKhlfST9rhYN0Vzy10AVWvmGFx19v/Yzv7jvcnufvmS0XyS2XhEqQJO6gh0v8OM1VPFuRmnJFfTIUlnB+VGYv4gBdt6wxIgUIS+dpNiAPgKahD+QGFJqw+0o/TVEgiE8HffogeNbycDlT/kJXjmw7oAGMhs5t/eQtmX8p8Iip6QUWVd2VXeH8aE3i4gCW04+jSNEKlvrviBOHVXjsQlXHmS5vFivFjFsGzyWVCn8sTsNbMVSUNH+mxorV3xUpbhclxrWuRZ3+1fq74=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(3023799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	z+JtBNttoJWfAGirwkySqwvIw8YNGiIcWdYw8B79h5B2bpYiZrKI2tE3R6RWean7kA8edu34pmBUgV2cJC02NGD6aN9wF7aF0btthVFxR4Bh7AUqk6VXk8ezZM/HINPNTBJd0jqqoDEafD243+xvuAdpRYC4+7MzBbOEUN24Q/2CPbtW+/ALbUCNoLlvIx2izmBNp5qObUOKb84o8jOWS0LzYvg2WUjRtc4CUAjq9vRTQBQdxTWzTPUlofyextfmsRdhZnDG22BOnrZLeIraKgeO1+nTFbMf47/I6ST8ZMZBnndNkkM9vt1kvkiiAbMrpoG6QWcj7oTRwYID0rVxeUFqsvrDlEJyAKVmYowRfeq7P5SrUae2sJVYcQ1kM867H9mhKuQ71RZ2cpnG0lCO643L+qBt0wy1E5jl1xSyUZ1V0/pnivbC/WcHNolf3OzZ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:03:16.9606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6d669a-2503-4cbe-12eb-08deaff48b14
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8065

On 26-05-11 23:02:32, sashiko-bot@kernel.org wrote:
> EXTERNAL EMAIL
> 
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Leaked usb2_phy initialization on usb3_phy acquisition failure.
> - [High] Leaked role switch and DRD resources on core role initialization failure.
> - [High] Unbalanced pm_runtime_forbid() call permanently leaks the runtime PM usage counter across bind/unbind cycles.
> - [High] Hardware PHY is powered off without calling synchronize_irq() during runtime suspend.
> - [Medium] Exported PM helpers in glue.h lack static inline stubs for disabled PM configurations.
> --
> 
> commit a327903170c6c0082aaebdb421558ca806f906da
> Author: Peter Chen <peter.chen@cixtech.com>
> 
> usb: cdns3: plat: Expose platform core driver as library
> 
> This commit splits the Cadence USB3 platform probe, remove, and PM paths into
> exported core functions. It also adds a new header glue.h to document the
> probe data structure and public entry points, allowing SoC glue code to
> instantiate the core deterministically.
> 
> > diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
> > index 3fe3109a3688a..2219cbff1c592 100644
> > --- a/drivers/usb/cdns3/cdns3-plat.c
> > +++ b/drivers/usb/cdns3/cdns3-plat.c
> [ ... ]
> > @@ -59,29 +60,21 @@ static int cdns3_plat_host_init(struct cdns *cdns)
> >  }
> >
> >  /**
> > - * cdns3_plat_probe - probe for cdns3 core device
> > - * @pdev: Pointer to cdns3 core platform device
> > + * cdns3_core_probe - Initialize the Cadence USB3 platform core
> > + * @data: Controller context and platform device supplied by the glue layer
> >   *
> >   * Returns 0 on success otherwise negative errno
> >   */
> > -static int cdns3_plat_probe(struct platform_device *pdev)
> > +int cdns3_core_probe(const struct cdns3_probe_data *data)
> >  {
> > +     struct platform_device *pdev = data->pdev;
> >       struct device *dev = &pdev->dev;
> > -     struct resource *res;
> > -     struct cdns *cdns;
> > +     struct cdns *cdns = data->cdns;
> > +     struct resource *res;
> >       void __iomem *regs;
> >       int ret;
> >
> > -     cdns = devm_kzalloc(dev, sizeof(*cdns), GFP_KERNEL);
> > -     if (!cdns)
> > -             return -ENOMEM;
> > -
> > -     cdns->dev = dev;
> > -     cdns->pdata = dev_get_platdata(dev);
> > -     if (cdns->pdata && cdns->pdata->override_apb_timeout)
> > -             cdns->override_apb_timeout = cdns->pdata->override_apb_timeout;
> > -
> > -     platform_set_drvdata(pdev, cdns);
> > +     dev_set_drvdata(dev, cdns);
> >
> >       ret = platform_get_irq_byname(pdev, "host");
> 
> Further down in this function, if devm_phy_optional_get() for cdns->usb3_phy
> fails (e.g. with -EPROBE_DEFER), it returns directly via dev_err_probe(),
> bypassing the error cleanup path in err_phy3_init.
> 
> Does this leak the usb2_phy initialization since phy_exit(cdns->usb2_phy) is
> never called?
> 
> If probe is deferred and retried, will this repeatedly increment the PHY's
> init_count, preventing it from ever powering down?
> 
> Also in this function, after cdns_init(cdns) successfully registers resources
> like a role switch, if cdns_core_init_role(cdns) fails, the error path
> jumps to err_cdns_init:
> 
> err_cdns_init:
>         set_phy_power_off(cdns);
> err_phy_power_on:
> ...
> 
> This error path only powers off the PHYs. Can this permanently leak the role
> switch and DRD resources by omitting a call to cdns_remove(cdns) or
> usb_role_switch_unregister()?

Ack.

It is the issue current code exists, I will fix it first.

> 
> Towards the end of this function, pm_runtime_forbid(dev) is conditionally
> called to increase the device's runtime PM usage count:
> 
>         if (!(cdns->pdata && (cdns->pdata->quirks & CDNS3_DEFAULT_PM_RUNTIME_ALLOW)))
>                 pm_runtime_forbid(dev);
> 
> Should there be a corresponding pm_runtime_allow(dev) in the remove path to
> balance this count?

Ack.

> 
> [ ... ]
> > @@ -195,14 +188,41 @@ static int cdns3_plat_probe(struct platform_device *pdev)
> [ ... ]
> > +/**
> > + * cdns3_core_remove - Tear down the Cadence USB3 platform core
> > + * @cdns: Controller context previously initialized by cdns3_core_probe()
> > + */
> > +void cdns3_core_remove(struct cdns *cdns)
> >  {
> > -     struct cdns *cdns = platform_get_drvdata(pdev);
> >       struct device *dev = cdns->dev;
> >
> >       pm_runtime_get_sync(dev);
> > @@ -213,24 +233,30 @@ static void cdns3_plat_remove(struct platform_device *pdev)
> >       phy_exit(cdns->usb2_phy);
> >       phy_exit(cdns->usb3_phy);
> >  }
> > +EXPORT_SYMBOL_GPL(cdns3_core_remove);
> 
> Since pm_runtime_forbid(dev) was called in the probe function, could the
> absence of pm_runtime_allow(dev) here permanently leak the runtime PM usage
> counter across bind/unbind cycles?
> 
> If the driver is repeatedly unbound and bound, will the usage counter
> continuously increment, eventually preventing the device from entering a
> runtime suspended state?

The same comments for above issue.

> 
> [ ... ]
> > @@ -242,7 +268,7 @@ static int cdns3_controller_suspend(struct device *dev, pm_message_t msg)
> >       else
> >               wakeup = device_may_wakeup(dev);
> >
> > -     cdns3_set_platform_suspend(cdns->dev, true, wakeup);
> > +     cdns3_set_platform_suspend(cdns, true, wakeup);
> >       set_phy_power_off(cdns);
> >       spin_lock_irqsave(&cdns->lock, flags);
> 
> The controller uses shared IRQs, such as IRQF_SHARED for cdns->wakeup_irq.
> The PM subsystem guidelines require drivers using shared IRQs to call
> synchronize_irq() before powering down hardware.
> 
> Might calling set_phy_power_off(cdns) here before synchronize_irq() risk
> hardware PHY being powered off while an interrupt handler is executing
> concurrently on another CPU?

Ack.

Will call synchronize_irq() at the beginning of function cdns3_controller_suspend.

> 
> [ ... ]
> > diff --git a/drivers/usb/cdns3/glue.h b/drivers/usb/cdns3/glue.h
> > new file mode 100644
> > index 0000000000000..67cd1073b5551
> > --- /dev/null
> > +++ b/drivers/usb/cdns3/glue.h
> > @@ -0,0 +1,51 @@
> [ ... ]
> > +/*
> > + * The following callbacks are for glue drivers to invoke from their own
> > + * &dev_pm_ops, so platform-specific work can wrap the shared controller logic.
> > + */
> > +int cdns3_runtime_suspend(struct cdns *cdns);
> > +int cdns3_runtime_resume(struct cdns *cdns);
> > +int cdns3_pm_suspend(struct cdns *cdns);
> > +int cdns3_pm_resume(struct cdns *cdns);
> > +
> > +#endif /* __DRIVERS_USB_CDNS3_GLUE_H */
> 
> These functions are conditionally compiled in cdns3-plat.c depending on
> CONFIG_PM and CONFIG_PM_SLEEP. However, they are unconditionally declared
> here without empty static inline fallback stubs.
> 
> If a glue driver uses __maybe_unused annotations instead of #ifdef CONFIG_PM
> for its own callbacks, will the compiler still attempt to resolve these calls
> and produce undefined reference linker errors when PM is disabled?
> 

Ack

The PM helper declarations in glue.h should indeed be made robust for glue
drivers using __maybe_unused PM callbacks. The current Sky1 glue driver uses
CONFIG_PM/CONFIG_PM_SLEEP guards, but the public glue header should not rely
on every user doing that. I will add static inline stubs for the disabled PM
configurations in v2.

-- 

Best regards,
Peter
