Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268F136F900
	for <sashiko@lists.linux.dev>; Tue, 12 May 2026 07:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778570925; cv=none; b=htrZsEeUj3KTt/oeI0ACukqu7xiueujpDUCsq/E7eZ54wfusiImaZbddd6HK/sksPhAT+m03Yov8S6x9F+Nh96nheMyKXsWyNIe/Xg0QmYvEGzjNvHj2+UUZsimmLVfPVTvUbx5oh7JhVaIujROSnePjxcjDB3tLm2LMTChX3EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778570925; c=relaxed/simple;
	bh=84A22km1KJS7ohvLcn8NFUzDOJ5WRQI7XtWD+bqnCbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRM7n6fX1mK2Ct0vZMONJ8F4bwtvMrxzJcNzp3nh8Ms8gTFubZ8CFSBe1lB0l7jt1oQYu6B39F1yS8FV5qQhURU25POOzp+/XYliC0caFHflOr/ai1JogNmsFMFEkLzanYyRObIv/SsezYj514mJ89uuNpZDUtRuMQeDYGPaP38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yeka63cf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yeka63cf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0046078so42792855e9.1
        for <sashiko@lists.linux.dev>; Tue, 12 May 2026 00:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778570921; x=1779175721; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWvTL0tj1UiSp5XvFkKfJfNmF1yoJumXRSTgl3CBIdU=;
        b=Yeka63cfwwIN03M+RHI6OPc/sqsxdXLYw8lOgyyr+GFvsmtR0Zql1RUmImtBhVUSrW
         qiHGOD7FoquGEQF19oFvomC4lWxDK1ebUCMSwtvA4g9PRlMJsvouOpo2uN/oJsbCAH5J
         hZSxWkNiDwOkkUEjP1Q6oSaENeORk6znT2/3rfNoNFRYTICM15NAneMZavRKcVoPpmus
         uWrxelsLB32BB5jb2gLs0lmz6Y/XnvrptqS6gDlKrho5uolk6lyLvzrXf4hZICPlawxa
         fnKpEAuopaSMnu3OM4t9nk5A8vVHNFuEZA6jQKxk41+wOyzXTwdoeaWmbdrlna4UX/sJ
         3wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778570921; x=1779175721;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWvTL0tj1UiSp5XvFkKfJfNmF1yoJumXRSTgl3CBIdU=;
        b=VlPCU36Ewugs9989YhnMUW9ayiJLZbJXkxj4SBX27OESIRDAWa6VLPhPKS8IKZWuHI
         NcxubUd376d0K4SAbn+N+pRKCFtqOpo7EJcIrNotMnOXsH9XC+eWylipFpMBFWalw+Ql
         LUDSOdGKg/BXlKWsAN6DyBYhVv1zEl1wS210Wnz8isBbtiyI8CPbL2A++ezus99ZC/Pw
         v6ntmDz+onsiV593zomyrVGTF6UHs3VGONhVLVoBHa+Qq4Nbu1N7OYV299MkvE28J1ob
         jZPtBmCeZFmFC3YSlFVZYEzou3xx8hQBxdtzhc0jwwspQIEVvmgTEf5VDjH6tQSdU7iR
         3CoA==
X-Forwarded-Encrypted: i=1; AFNElJ+bZsJ61a1H69rjrDbtEmSvPZ2WT472/9GBDFiUPQGDyr9EineC0yYOBpG10SQO+jOow9L6Oyv6@lists.linux.dev
X-Gm-Message-State: AOJu0YzHi6oFVO5zjYn7tTHHgWfE0xkDxRRCHacA9y3M0Piimy1z/XL+
	g9HquAXm1icdAah2mTRrVmulZSH3a6/CG4xA4oiv0n3tG7Ab7Kp3sjJJ6KUKAY5OsqU=
X-Gm-Gg: Acq92OGdX8DIZJancUILLqZTl2LJ5xklUQ8nmAQ6svvEDqrJDqsQmtFDVi4VnjAEhWY
	3hCOOsStEZyBQV0OWWJvhiiCmeFZ5WC7G6lFpvTwtLXaVxUqcd+2RGkZKFTqinVziuv1c5OHnZZ
	9mu7UUi32zHlzL/DM9CK/08k/CVCSSVtoMPupxHGUytSx/PtOReCJiCfNjTbO1zZrIo40CCcflw
	Yyz+ds31lmnZoXdivHRrktYNRvYh4g3yeGb4SRrpAYv2SDAWXWj6beXrWMc51+QE+mUw/datBKf
	fO/UX51uEvxOn4EN1KII+woVr/Y5tiFqge63YG/zhgpnKNhjO7wjq7twx2/WVSIdpI5XPyd+/od
	ubYse9hqXJgpYKwLRxnSPxT0gM6kglKvIeOzIHJOXwm5rH5eR7cw+zFq/mUqg9k5ALCSJItsZVK
	v3AM4IS7L1tZLSsqAdbxbzoOvLgm1bUyWwKNV/17Qx0rQTd+qh1knheX7burqIMIyXVKFOm207D
	NP9u9M=
X-Received: by 2002:a05:600c:4fc4:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48e706c48d5mr195702525e9.21.1778570921279;
        Tue, 12 May 2026 00:28:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:7b25:be71:cc9e:5d64? ([2a01:e0a:106d:1080:7b25:be71:cc9e:5d64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm26994509f8f.4.2026.05.12.00.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:28:40 -0700 (PDT)
Message-ID: <1d04c00d-ee66-4467-b60e-f36326b90f11@linaro.org>
Date: Tue, 12 May 2026 09:28:40 +0200
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
To: Alexandre Hamamdjian via B4 Relay
 <devnull+azkali.limited.gmail.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, sashiko@lists.linux.dev
References: <20260511-pocketds-v2-3-299dd4247f2f@gmail.com>
 <20260512035021.60C11C2BCB0@smtp.kernel.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260512035021.60C11C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 5/12/26 05:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 10 potential issue(s) to consider:
> - [Medium] Missing DisplayPort AUX (SBU) Routing in Type-C connector.
> - [Medium] Missing thermal `cooling-maps` and incorrect trip point types.
> - [Medium] Invalid DAPM widget in `audio-routing`.
> - [Medium] Missing `pinctrl-1` property in `pwm_fan` node.
> - [Medium] Improper Audio Amplifier Initialization via pinctrl.
> - [Low] Downstream device tree property `rocknix-u-boot-dt-id` included in root node.
> - [Low] Missing `compatible` string in `panel@0` node.
> - [Low] Unreferenced `volume_up_n` pinctrl state, missing Volume Up button.
> - [Low] Extraneous `orientation-gpios` property in `pmic-glink`.
> - [Low] Deprecated `gpio` property used in fixed regulators.
> --
> 
> commit 22f111b3d5157012d6f5d9d466cfb26e61ed3b56
> Author: Teguh Sobirin <teguh@sobir.in>
> 
> arm64: dts: qcom: add basic devicetree for Ayaneo Pocket DS gaming console
> 
> Add initial Device Tree for the Ayaneo Pocket DS gaming console based
> on the Qualcomm QCS8550 platform.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
>> new file mode 100644
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs8550-ayaneo-pocketds.dts
>> @@ -0,0 +1,1861 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
> [ ... ]
>> +/ {
>> +	model = "AYANEO Pocket DS";
>> +	compatible = "ayaneo,pocketds", "qcom,qcs8550", "qcom,sm8550";
>> +	rocknix-u-boot-dt-id = "u-boot-pocket-ds";
> 
> Is this downstream U-Boot property intended for upstream submission?
> It does not appear to be documented in the upstream DT bindings.

It's right, please drop this

> 
>> +
>> +	aliases {
> [ ... ]
>> +	tca6424_vcc: regulator-tca6424-vcc {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "tca6424_vcc";
>> +
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 168 GPIO_ACTIVE_HIGH>;
> 
> This isn't a bug, but could we use gpios here instead of the deprecated
> gpio property? This also applies to vdd_ts and vdd_fan_5v0 later in the file.

"gpio" is still valid but we use gpios now

> 
>> +		enable-active-high;
>> +		regulator-boot-on;
> [ ... ]
>> +	pmic-glink {
>> +		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		orientation-gpios = <&tlmm 11 GPIO_ACTIVE_HIGH>;
> 
> Does the qcom,pmic-glink driver read orientation-gpios?
> 
> The driver appears to rely on IPC with the firmware to determine Type-C
> orientation, which would make this property unused here.

This is plain false, we use orientation-gpios since sm8550 since can't have the orientation
via ucsi messages.

> 
>> +
>> +		connector@0 {
>> +			compatible = "usb-c-connector";
>> +			reg = <0>;
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					pmic_glink_ss_in: endpoint {
>> +						remote-endpoint = <&redriver_ss_out>;
>> +					};
>> +				};
>> +			};
>> +		};
> 
> The commit message states DisplayPort is muxed over the USB-C connector, but
> port@2 (SBU) is missing. Is SBU routing needed here for the DP AUX channel
> (link training and EDID) to ensure DisplayPort Alt Mode functions correctly?

Yeah please check, an SBU mux is certainly missing, or maybe the redriver is used
as SBU mux, the nb7vpq904m supports SBU muxing on port2/

> 
>> +	sound {
>> +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
>> +		model = "SM8550-APS";
>> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>> +				"SpkrRight IN", "WSA_SPK2 OUT",
>> +				"VA DMIC0", "vdd-micb",
>> +				"VA DMIC1", "vdd-micb";
> 
> Is vdd-micb a valid DAPM widget name here?
> 
> It looks like the regulator supply name for the VA macro. Will DAPM fail to
> parse this route and leave the digital microphones' bias voltage disabled?

It's right, drop this

> 
> [ ... ]
>> +	pwm_fan: pwm-fan {
>> +		compatible = "pwm-fan";
>> +
>> +		pinctrl-0 = <&fan_pwm_active>, <&fan_int>;
>> +		pinctrl-names = "default", "sleep";
> 
> Are we missing pinctrl-1 here?
> 
> Since pinctrl-names defines a sleep state, won't the PM core fail when
> attempting to look up pinctrl-1 during transitions?

It's right, please fix

> 
> [ ... ]
>> +&cpuss0_thermal {
>> +	polling-delay = <200>;
>> +
>> +	trips {
>> +		cpuss0_fan0: trip-point2 {
>> +			temperature = <40000>;
>> +			hysteresis = <3000>;
>> +			type = "passive";
>> +		};
> 
> Should the trip point type be active instead of passive since these are
> intended for a fan?

Yes, please link those to the fan like on Ayaneo PS2

> 
> Also, are the cooling-maps omitted intentionally across the thermal zones?
> Without them, the kernel thermal framework cannot bind these trip points
> to the pwm_fan cooling device.
> 
> [ ... ]
>> +&pm8550_gpios {
> [ ... ]
>> +	volume_up_n: volume-up-n-state {
>> +		pins = "gpio6";
>> +		function = "normal";
>> +		power-source = <1>;
>> +		bias-pull-up;
>> +		input-enable;
>> +	};
> 
> This pinctrl state is defined but does not appear to be referenced anywhere.
> Are we missing a gpio-keys device node to instantiate the Volume Up button?

Add the gpios keys for the volume+

> 
> [ ... ]
>> +&tlmm {
> [ ... ]
>> +	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
>> +		pins = "gpio7";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		bias-disable;
>> +		output-high;
>> +	};
> 
> Will setting output-high statically configure the active-low speaker shutdown
> pins to drive high at boot?
> 
> This might prematurely power up the amplifiers before the audio framework is
> initialized, potentially causing an audible pop noise.

Drop all the output-high in tlmm, this comes from downstream

> 
> [ ... ]
>> +&mdss_dsi0 {
>> +	vdda-supply = <&vreg_l3e_1p2>;
>> +
>> +	status = "okay";
>> +
>> +	display_panel: panel@0 {
>> +		reg = <0>;
>> +
>> +		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
>> +		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
>> +		pinctrl-names = "default", "sleep";
>> +	};
>> +};
> 
> Does this panel node need a compatible string?
> 
> Even if panel support is being added later, leaving a child node on an
> enabled DSI host incomplete violates the DT schema and will likely cause
> the DSI core to fail when parsing child devices.
> 

Please drop all DSI related stuff including this panel and associated regulator &
pinctrl nodes and add them when the panel stuff is ready.

It seems you never tested your DT, please run :
make CHECK_DTBS=yes qcom/qcs8550-ayaneo-pocketds.dtb
before sending a v3.

Neil

