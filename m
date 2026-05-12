Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023084.outbound.protection.outlook.com [40.107.44.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14048384CDE
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 07:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778571801; cv=fail; b=cjlvrwnTO7WV2dT5nwwz5YTgVlHY0/5sWD9arZyoWdyodoHWwpyGAP5kEKdco3phD1IzM8Fipo6u5+W0+/dcxSpTTU6AGyd7bKPUx0nLjKXnkUl2+4QPiaD/FHteCyMIVgG57A17HXhKJAuJfWZ4/2EtX5WIAbKfHk8cJIKc+NY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778571801; c=relaxed/simple;
	bh=zohgms7rQ3DKEgxJj61ad17csgnczWNPBeJzUrNa3kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zx8uql1zSRYf0+WlRIoIOo+FAR0+0uGhbb1SIk3Uy68QotM//V2b3GmTHy04dShPF6LuXYYO13cDzMRz92nLYFRt6dy/AY3EwPivPzBzuReh9YwGRVyrD2G2wHdal3Ej/Ajd7YrOH8qXc8tQEp8/Zajx3NaPADPLu4P5unPmPxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNFDJkup6z7mk7vFZWFhXuySGq1OCpV2XhFKfEyqJRsEB3Rd2Z6WC3CJ2xBPzcaqgmmtxjup7gJusUbMIrJYmkf49CXiTwoD33dqmYzx1VHiMXRc/V2mjgr/hh07IQgeSwHK150eT+dHkk2MBzG8JLKsS8mmenxauLGFumYbzVEXzQF38A5f/XXUwr1PRy7b0dbUpna8uFoiU+OKBhJw8CE4KH4Dh6LsMW9JimiZFN/Hufl53InIGgbypDgmyi4oHdDi4RPmGds4rn6FUprZMtM6rGHzd/LmGz5fJ9lThohQKQzTvb4SO7IGO4e9+vkpkrtwqK2hQveUJptwqxj2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pp5v7NJQulDaIzVT0Sho768aWEaUbY4o7bwwaLsr660=;
 b=MvScSWDKwl88dbl9vEAORF1yqp3o4iddNwRNPKXVqgCr/vNNQ7CpiOcmV3NqoWhKW+VgavcUeRsrG5Ya99hwu4tt257U3htd0WV2YiH1wnWE0EkIDbXOPbdRpG54L264C3dE+fPXxpZDv9hIoNdeNFWAtFBZX9zbGt0T7AxSleSuW7fmDwyfw0V5Sg3Guh9l7xy9EGESnkG5Y25ruWjCLiNh63CUGjE7u3c1GTHVZPq7W2A5HOscHuDG7zs+eEx3JFRNrWr5PHAAkc2nIHsKIGIOLsjWJgX9i6NY6eic9CWYHoqrfC3G1xao6obh61y+vWEworm3hRa+17IfF+SAGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0031.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:29d::6)
 by KL1PR06MB6736.apcprd06.prod.outlook.com (2603:1096:820:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 07:43:13 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:400:29d:cafe::a) by TYCP286CA0031.outlook.office365.com
 (2603:1096:400:29d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 07:43:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 07:43:12 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E9B8D41609C1;
	Tue, 12 May 2026 15:43:11 +0800 (CST)
Date: Tue, 12 May 2026 15:43:10 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: sashiko@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH 2/4] usb: cdns3: sky1: Add cdnsp-sky1 glue driver
Message-ID: <agLaDrzSZLhlG1sp@nchen-desktop>
References: <20260511024244.981941-3-peter.chen@cixtech.com>
 <20260511231734.9BDBCC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511231734.9BDBCC2BCB0@smtp.kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|KL1PR06MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de28afd-b562-43f9-c568-08deaffa1f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|18092099006|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	E4uveVkPRViJ5SxnnX0RBFu5LKwnWfrPXu+qVKyP2GaA1GLsqKyUfyAhuSoU+sezhmwW/k47dhoA5/rsvu2XjtbZA2Po8QocpnEKWRPSzM3XGA1Unjn3saOaBopFgGwbC6UjDV0BRL/l7UbklB3PzlNc7hM5vqQJ09Kc/wd2LFbc5mNdH1gppNbW/Xuq7FWD7RX3iFzmYdkuqi4FO24MNOeEV8KnkzzHOqSzsnHov5lCGwjsAdM+VkXD0wO3YyInZTIg0/3uoNN7tlpAQT0Nk3CyXvIw3pX1cj5wu0EcxQxA/CNIngeykzFZv0fd3um9jZwNzJYs5l2knYcEQmWaD5kaBrKpccdQU2/D4T4hi9e7Q4L8r0m/oaLHEuiGOqHV401y/Pvdr3WRSNh4vRFjEhyk4M7sV5LL1T5oQi6o+f4bzbCEAt+Tu6E8+zulDno69Fecbza+H2C5BWSfmPM9/e5/whdnvMRp6aKdh/VTaY9+yG8agONz33XQ9BEPUlD6hVquUnwPwNMtzMU3dZAlNgWpERC51Pq6/OircGozTNBdwa8X8ZyAqB2+AHhaKUgVDJDgMiqlpD71gKE8ClSq0c5t+nFZv1fLkg0mfGKG493mI00uVvS9aOOu/HV81uTTD9CdPv7zW6KqafHaivHWnsF4Jj05658H4CZNPle6l3fvQ6cagpOad1OuokNUBs74RnjfRkVGMw7Co711LoUyOne84NvPUuj+XBBjAwmzINM=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(18092099006)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LcLCd5gt9UtFHxNAJlV21zLXbKqQZpBKo7NTWi7BQYM1ZhjhzOeneXmLIEfqo3zbQo2BSpmtG0zC2/SMyQaDrtn94Dn3nJ+mR0/ZyzHLJLjDIUJu2Ed5vUQRxcJ8pW/vmqUpAj9/pkQ3JPjNNbFO/Z34B8a9lZ879sbdpFYEbJf7kfWz+2tCpdRBOm5CIxiJmAQ1MXlBLc+C3PbDYmWMPonJOncErZP3RNlOgTsju0sTO3EsnRWJ+4ivdaEYxuGxGJYmLRG6KzQip9n/wJL1TThOjCgPHPTMPOdXOco6AN3N3OVQfr/xhGSgFWzwns1qVqGVxfF/ZH79XvRnlLMxCGSBmhfyUdcZogB0uWDTEp1VmerlvoDJCm2WtQrVhahRVWVfpcvlH+++baPnl5RLfNH/5SGCHRT1lglz4dagsAxZn+PjNwcCQOTCrlU/WCJv
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:43:12.8593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de28afd-b562-43f9-c568-08deaffa1f0c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6736

On 26-05-11 23:17:34, sashiko-bot@kernel.org wrote:
> EXTERNAL EMAIL
> 
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Probe returns success (0) when memory resource retrieval fails, leading to a NULL pointer dereference.
> - [High] Probe forcefully overwrites the mode strap configuration for all USB controllers on the SoC.
> - [Medium] Resource leak of clocks on early probe error paths.
> - [Medium] Unconditional assignment of dev_pm_ops violates Power Management Subsystem rules.
> - [Medium] Commit message and implementation mismatch regarding hardware resets.
> - [Low] Using of_match_ptr() with a statically allocated array causes compiler warnings.
> --
> 
> commit a626bc93f86adbca6a4dce0b669265133a32a8cb
> Author: Peter Chen <peter.chen@cixtech.com>
> 
> usb: cdns3: sky1: Add cdnsp-sky1 glue driver
> 
> Add a CIX sky1 platform glue driver with Kconfig and Makefile entry.
> It calls APIs exported from cdns3-plat.c for probe/remote/suspend/resume
> routines.
> 
> >         Glue driver for the Cadence USB dual-role controllers on CIX Sky1
> >         (device tree compatible cix,sky1-usb3). It enables clocks and resets
> >         from the SoC, then uses the shared cdns3 platform core (cdns.ko).
> 
> The commit message mentions it enables clocks and resets from the SoC, but is
> there missing code to handle the resets? The implementation includes linux/reset.h
> but doesn't appear to request or interact with any reset lines.

Sorry, I have a local version with PHY driver, it needs to have reset operation, I
forget to delete it at commit message.

> 
> > diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky1.c
> > new file mode 100644
> > index 0000000000000..049044e3d09bd
> > --- /dev/null
> > +++ b/drivers/usb/cdns3/cdnsp-sky1.c
> 
> [ ... ]
> 
> > +static int cdnsp_sky1_set_all_controllers_otg(struct regmap *syscon)
> > +{
> > +     int id, ret;
> > +
> > +     for (id = 0; id < SKY1_USB_S5_NUM; id++) {
> > +             ret = cdnsp_sky1_set_mode_by_id(syscon, id, MODE_STRAP_OTG);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> 
> Does this code unintentionally alter the state of other independent USB
> controllers? It appears to iterate through all controllers on the SoC and
> updates them to MODE_STRAP_OTG, which might affect concurrent controllers
> that are explicitly configured as host-only (like U2_HOST0_ID).

All controllers for CIX have OTG hardware, it depends on OTG register to set
proper mode, so set all controllers DR mode as OTG by default.

> 
> [ ... ]
> 
> > +static int cdnsp_sky1_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct cdnsp_sky1 *priv;
> > +     struct cdns *cdns;
> > +     struct cdns3_probe_data probe_data;
> > +     struct resource *res;
> > +     int ret;
> > +
> > +     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->dev = dev;
> > +     priv->num_clks = ARRAY_SIZE(cdnsp_sky1_cdns_core_clks);
> > +     priv->clks = devm_kmemdup(dev, cdnsp_sky1_cdns_core_clks,
> > +                                sizeof(cdnsp_sky1_cdns_core_clks), GFP_KERNEL);
> > +     if (!priv->clks)
> > +             return -ENOMEM;
> > +
> > +     ret = devm_clk_bulk_get(dev, priv->num_clks, priv->clks);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to get clocks\n");
> > +
> > +     ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to enable clocks\n");
> > +
> > +     priv->usb_syscon = syscon_regmap_lookup_by_phandle(dev->of_node,
> > +                                                        "cix,syscon-usb");
> > +     if (IS_ERR(priv->usb_syscon))
> > +             return dev_err_probe(dev, PTR_ERR(priv->usb_syscon),
> > +                                  "failed to get cix,syscon-usb regmap\n");
> > +
> > +     ret = cdnsp_sky1_set_all_controllers_otg(priv->usb_syscon);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret,
> > +                                  "failed to set USB controllers to OTG strap\n");
> 
> Can these error paths cause a resource leak? The clocks were previously enabled
> via clk_bulk_prepare_enable(), but these direct returns bypass the err_clk
> label where clk_bulk_disable_unprepare() is called.

Will fix at v2.

> 
> > +
> > +     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
> > +     if (!res)
> > +             goto err_clk;
> 
> If this resource retrieval fails, does the probe function return success?
> 

No, the "glue" region is mandatory.

> The ret variable was previously set to 0 by the successful call to
> cdnsp_sky1_set_all_controllers_otg(), so jumping to err_clk without updating
> ret to an error code like -ENODEV would result in returning 0.
> 
> Could this lead to a NULL pointer dereference during subsequent power
> management operations? Since the device would be considered bound without
> calling cdns3_core_probe(), dev_get_drvdata() might return NULL in
> callbacks like cdnsp_sky1_runtime_suspend().

NAK. Other values except for NULL is correct for platform_get_resource_byname.

> 
> [ ... ]
> 
> > +static const struct of_device_id cdnsp_sky1_of_match[] = {
> > +     { .compatible = "cix,sky1-usb3" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, cdnsp_sky1_of_match);
> > +
> > +static struct platform_driver cdnsp_sky1_driver = {
> > +     .probe          = cdnsp_sky1_probe,
> > +     .remove         = cdnsp_sky1_remove,
> > +     .driver         = {
> > +             .name           = "cdnsp-sky1",
> > +             .of_match_table = of_match_ptr(cdnsp_sky1_of_match),
> 
> If the kernel is built with CONFIG_OF disabled, of_match_ptr() evaluates to
> NULL. Since the cdnsp_sky1_of_match array is declared statically and without
> __maybe_unused annotations, will this result in an unused variable compiler
> warning?

Will fix it by adding CONFIG_OF for cdnsp_sky1_of_match.
> 
> > +             .pm             = &cdnsp_sky1_pm_ops,
> 
> Does unconditionally assigning the pm callback structure produce dead code when
> CONFIG_PM is disabled? According to the power management subsystem guidelines,
> this should likely be wrapped with the pm_ptr() macro so it evaluates to NULL
> without PM support.

Will use pm_ptr for it.

-- 

Best regards,
Peter
