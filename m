Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022139.outbound.protection.outlook.com [52.101.126.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A560375AA8
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 03:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555420; cv=fail; b=FZA0RwLwibvOWce4YRUbfvIe0W6xQc0H9JoCNluh++piwh3dCmdjLuz1Jy/pjK+u5YoIiGOn7Bhk4t8KCCTgk6oGxl8970yFAsSWB3TwxbrgMOk81DLHwD1rtfcaArWkGdK6eEh+Fkh7cCUGlL56KYPiAcKECrx1QQmDLTcrHqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555420; c=relaxed/simple;
	bh=dEsZgbx3wkGPMkS1eDRfdeS9KaVMBDlDOj5xPHB/BuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+UTx/vGzQcBwL/XlFBxwcsfLnZ//+e1PlHIh1iw50w8xl2sZ5BYLT/b9ZoaZg9IextRNaWU7HupovkvCwbio8qgt7XhJ5ckInDQouBwnDkLPsuqbLK7P262SDe/RsiEu3IKydi/3U0pdYBi6PnaOtx+/8IPqIfVLmbmWzTUyAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuwIuB2FJD5n/ptrwS4pO5czRfh3ciHEytxvc2nHsmduH6O5ocqC0A+ew+WIog4AdQKhNaayWqsFnbsCyUyMnY5e7xDAvvp6PrVIoAapGYGOyl3s8GHPK5RI0Cdla0gim4c0V3qTs2TVQFRkwezs8XBXsQZw18Xu6ux/5XZlTrgEYGvaOxRvklR0XbLey6BXt3aXokXUMiD2/2QPoA5zDGF7DPc0v4yk6U7mKf3rPMMGY4L9CPPramuEjo7do5rQT0d5a27ywyZeFHjGjWXvfgDCAqrveYw4KKWoXv/zboP9JvSLkmgixr74xZMrvIV7Gh7fJxlDuwzrFWDaCHM4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9qboRB4YsZAE0Rs5np0kWBycjCD+IfQSJVLmIak0EY=;
 b=U4ioEDei55/c9uhuyspCuyXDpN9EKLXo/TOKbkrvTokwikc9HljB+9Gp7kBsRl+uu3PHy3D9lkF4+fXTbhdgBg3OPKxDcaBeKjvvyjoUUclJ1ch4vQb1ypyhCX7/uEsCWvkMPo9DznDbjx+OFjJXBf40F6QXkTrH0rOE43BZLF9kaHHzNMC/ZJ74nvPAvfI+23DSj64ZIrUjj4guizL5T+yIwZMnVDud8s7cFEfjnAU9uBmujtjFoKd4vkMJHelTLIOFKTWXjcRkZLmVQitMnCyLgiUhgkWOz5/Y551SVc3jexobm4rg7mdqYc8Apov3SLbhnOzfy2A0H5D8TZzQtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0024.apcprd02.prod.outlook.com (2603:1096:4:195::18)
 by KL1PR0601MB5549.apcprd06.prod.outlook.com (2603:1096:820:c0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 03:10:14 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:4:195:cafe::ac) by SI2PR02CA0024.outlook.office365.com
 (2603:1096:4:195::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 03:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 03:10:12 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4D25F41609D5;
	Tue, 12 May 2026 11:10:10 +0800 (CST)
Date: Tue, 12 May 2026 11:10:09 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: sashiko@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: cix: add Sky1 USB4 and USB5 controllers
Message-ID: <agKaEePSFknhDBg2@nchen-desktop>
References: <20260511024244.981941-5-peter.chen@cixtech.com>
 <20260511235922.10315C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511235922.10315C2BCB0@smtp.kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|KL1PR0601MB5549:EE_
X-MS-Office365-Filtering-Correlation-Id: 200f9507-7816-4633-758d-08deafd3fc19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|3023799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uFYJio34+FfkvTyoCUr6B8KLCuDH6PxT83Crm9SoRvorzuyuNY4+vugxVYp+rjFlcNMsvQMYd1CBU+IlrCwKLysa+5qVUkqyZ/qMzgDCkne2TfRURFLHN9zE20zuWCdx4lvyeYIKDJT/xFDDjlMHyVn3ilh7mNz2o9y/3rSkyV9R/jXEzw2NXfCMqFuBqU3PQWy2GCPZM4GXNtdsJ+xomL18KOiI4ikg81Remig/4iVxy4dLW9CPuDz1jgtAeLzKPPAYGcXArc+92uBV1WWHt7f3X2TyiaZwuVikwLLwTYNIq81+guYvQYQa1QE1swAhYPYIK15UhleTSaSoywt1JfsH4pB+LnIRgIuqmjUV9PBV5YfLh+hCoJCAk7OL3vDTX+fuxt18CneIHcLePQorZr6NpNoF1lBGQOtNKshSPdQ9IZE3/950B5oft4x9SPs7VriXFMJ+bx0st1aqcMaeM/QQ2A6ZgPZ80n3q3na7t69QxwjZcLmIEc6ghqujIcbR3fymzty0IYaiHie62Bm+5nVPFIsy0Sf2lTZImri6pDMvEbrs9f9OdW8+Qo/lu1HeCJ3Am2c2PeSlmZXuIRmqoJnjm0Qy05oT2ROf9P2r5rbnNbP5aDMHfIe3dtpUwdOz4NDx3mPJwiZhq4JLDclnSAD/snRCl2MD7S9Z+QTcVJp91WR01lZvTtBGT/rrbukC/pyc2re7fJ2S+Wl02wojnSinwTC3P6MXdEfI3eMUL6U=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(3023799003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IEp7ZktDzYS31hWvKYQMbNcD3LS4N49R+m4YIsSLgrA6ehp9bDvk/UOqVfp1+UuRaVNYuaLGbe9iyWJOJh4kEeJ2d+eVwH0aXzva5OtBTZ/C/pRfaDiWumLhfygBjjT1MUKYRmE0sZD7TR+w3yQVC9H1eQUsV61Q/GvdLbrBz5+cWdXeTOxGJKvgOfHWU5zRZAx3yrGfOtHlu9vnB1j9tVuAEAHF/nG3ynsgx2j2f46G2EhkYZoszt00pEHlq6Fx6I9hZEqlAFdfx2KHp7aOW5B0gK23h9JlNRSvOIaCdkAAejIUxfKTdY5czXzzlmPgo2AB3G0B+vsY/56tJqOKpqqy4ITJoxLrSO3s9ZlBpJQo/8yHP+XaO2kV1WhiErFrxp6M+xG88nCY4qsWmdY6gAAx7KmfhZt2UpcmSsGEL+BTxwazEzqHDXk8T+dmUOaS
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 03:10:12.9818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 200f9507-7816-4633-758d-08deafd3fc19
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5549

On 26-05-11 23:59:21, sashiko-bot@kernel.org wrote:
> EXTERNAL EMAIL
> 
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Medium] Missing `status = "disabled";` for `usb4` and `usb5` device nodes in the SoC-level device tree.

Ack
> - [Medium] Invalid double-vendor prefix in compatible string and squashing of SoC-specific glue layer with generic IP core.

Nak

> - [Low] Unnecessary inclusion of `<dt-bindings/phy/phy.h>` in `sky1.dtsi` without associated PHY definitions.

Ack

> - [Low] Redundant/duplicate interrupt mappings for the `wakeup` interrupt.

Nak

> --
> 
> commit a270480764c96a27fe2e14e30bfb46b99527fcfb
> Author: Peter Chen <peter.chen@cixtech.com>
> 
> arm64: dts: cix: add Sky1 USB4 and USB5 controllers
> 
> Add the Sky1 USB4 and USB5 Cadence USB3 controller nodes with their
> registers, interrupts, clocks, resets and S5 syscon control. Enable both
> ports on the Orion O6 board in host mode with the required VBUS pinctrl.
> 
> > diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> > index bb5cfb1f21133..9f7d9ad6586c3 100644
> > --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> > +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> > @@ -6,6 +6,8 @@
> >
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/clock/cix,sky1.h>
> > +#include <dt-bindings/phy/phy.h>
> 
> Since there are no phys properties or macros from this header used in the
> patch, is this inclusion needed?

Ack, will delete.

> 
> > +#include <dt-bindings/reset/cix,sky1-s5-system-control.h>
> >  #include "sky1-power.h"
> >
> >  / {
> 
> [ ... ]
> 
> > @@ -504,6 +506,72 @@ mbox_ap2sfh: mailbox@80a0000 {
> >                       cix,mbox-dir = "tx";
> >               };
> >
> > +             usb4: usb@91d0000 {
> > +                     compatible = "cix,sky1-usb3", "cix,cdns-usb3";
> 
> Does the "cix,cdns-usb3" string incorrectly combine two vendor prefixes?
> Should the generic fallback be "cdns,usb3"?

No. sky1-usb for specific SoCs "sky1", "cdns-usb3" for general CIX SoCs using
Cadence IP.

> 
> > +                     reg = <0x00 0x91d0000 0x00 0x4000>,
> > +                                     <0x00 0x91d4000 0x00 0x4000>,
> > +                                     <0x00 0x91d8000 0x00 0x8000>,
> > +                                     <0x00 0x91c0314 0x00 0x4>;
> > +                     reg-names = "otg", "dev", "xhci", "glue";
> 
> Does adding the "glue" register and cix,syscon-usb to the generic core
> break the generic upstream schema which expects only three reg entries?
> 
> Should the SoC-specific glue logic be implemented as a parent wrapper node
> with a child node for the generic Cadence USB3 core instead?

For sky1 USB, it uses Cadence USB3 core as library, so all register regions
need pass from one parent node.

> 
> > +
> > +                     interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,       /* host irq */
> > +                                     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>,    /* peripheral irq */
> > +                                     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH 0>,    /* otgirq */
> > +                                     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;    /* wakeup irq */
> 
> The wakeup interrupt uses the same GIC SPI line as the main host and
> peripheral interrupts. Is this redundant, and could it lead to conflicting
> interrupt registration?
> 

Not redundant, they are different interrupt handlers and knows itself at code.

> [ ... ]
> 
> > +                     cix,syscon-usb = <&s5_syscon>;
> > +                     dma-coherent;
> > +                     maximum-speed = "super-speed-plus";
> > +                     dr_mode = "otg";
> > +             };
> 
> Should this node include a status = "disabled" property so the USB drivers do
> not probe unconditionally on all boards using this SoC?

Ack

-- 

Best regards,
Peter
