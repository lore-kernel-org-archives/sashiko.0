Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917D82517A5
	for <sashiko@lists.linux.dev>; Mon, 17 Aug 2026 05:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786943842; cv=none; b=XCc7KgcR4aq2aK+R9eeUS6zTRSmHkz3R0RJxwKoZpn+3uU92CuK/E9j2WUE4h1nRmgLVkz59TEm663YyC/gdJem5Z2YB7NYI9B27iX3EFNQT7F9Y/FOsHHJJvY/I3JmFqZU5FonksxYOVanFUj2v4C/hNUCHrVedfyMQkdANVqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786943842; c=relaxed/simple;
	bh=d42/+Pww/12ox/O/LWwTiCYkgjGPcycRXDc7F6MpcyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JNTQvd9QkjK2viDXd1zYRAewJtR1e3LzQDaiCr2CLR25lW/K6x9V53tHRykTrw663c+/U5tAspWk11PvV28T/OktwOilp+Nbsz+V/q2987qdnLSX1/s94g5l099caTkfVk77Im6y+4L2GiJhV85FDtrvomju1kCGyPyV3EukvuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFDVy3RD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFDVy3RD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416B61F00A3E
	for <sashiko@lists.linux.dev>; Mon, 17 Aug 2026 05:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786943841;
	bh=BTdDl9mGi1K6PeXIdK1AsuL9aFR1Cv2yCvx2rmDIl7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eFDVy3RDxbCJM/aYCnCnPvbZeEbGDdrXqHJTPuDyvRcw8XOJ/RDX2neC5FQWYW+rr
	 0f9VazQbx5BdMayZpiyBiemP79aeK41wTBfHdCHwo9WObCB8zdeh7xOn4k9KGi+xf7
	 SY2ycZTqM8EIcltf3JsnetnmRy8rQFQP1l8ly1ItIeDpkpxNUOQdQf6sub/uocB50a
	 pxebmRiYp0NcyI70y5jps/TvUn6YYukt8ztH5Q+MIu84QbUfU0dOpFQVm6XNs+rYI7
	 OWiPxPEVL4bYTPnCksnQ0iMap4iH5zbrN3DIw5kbUx0IZbQ617LB3U02TP/p9tsBex
	 U5lMWj/tWhuQQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a3819e8be8so40262a12.0
        for <sashiko@lists.linux.dev>; Sun, 16 Aug 2026 22:17:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpAbf5fd3/yV1X2AB8gMcumuARlKf9nuSyT2430P4mySWJftXhmixMFYGVHU0qtUx3IPdC4mUSJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwEAWT+WSVKde7e6+WvXBQ1Hw1esvDwkxMwlF2Y0uLMnkTa+Vit
	e7FtCNSK5pH+2RP9SFav7wwLdRFBAYnanLy/wxLzn+AvbZaMMDyi93xkzYI9OPx2kJXZMKIeW33
	a8jVdzwKM2FKd1KRjqiwbI8NGhOL3L7c=
X-Received: by 2002:a05:6402:1cc7:b0:698:4501:3a8e with SMTP id
 4fb4d7f45d1cf-6a38af1daadmr6397998a12.9.1786943840111; Sun, 16 Aug 2026
 22:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260815-b4-of-property-add-i2c-parent-v3-1-c22588b6482a@nexthop.ai>
In-Reply-To: <20260815-b4-of-property-add-i2c-parent-v3-1-c22588b6482a@nexthop.ai>
From: Saravana Kannan <saravanak@kernel.org>
Date: Sun, 16 Aug 2026 22:17:08 -0700
X-Gmail-Original-Message-ID: <CACRMN=cXSy0ZYH78sQ88QKkwYtbE768kh=KzRhkYYCO4SX2m-Q@mail.gmail.com>
X-Gm-Features: AcwNN1UWVqBdFIAWK6GrswyzFK9ILDIU3DKpAjWy0YIJOSXr8xMcH5Q8BBP4ZnQ
Message-ID: <CACRMN=cXSy0ZYH78sQ88QKkwYtbE768kh=KzRhkYYCO4SX2m-Q@mail.gmail.com>
Subject: Re: [PATCH v3] of: property: add i2c-parent to fw_devlink supplier bindings
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>, sashiko@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 8:33=E2=80=AFPM Abdurrahman Hussain
<abdurrahman@nexthop.ai> wrote:
>
> Platform-device i2c muxes (i2c-mux-reg, i2c-mux-gpio, ...) reference
> the bus they multiplex with an i2c-parent phandle and hold a reference
> on that adapter from probe until remove. Unlike muxes that are clients
> on the parent bus, they live outside the adapter's device hierarchy,
> so nothing orders their teardown against it: if the adapter's device
> is unbound first =E2=80=94 e.g. while reverting a device-tree overlay who=
se
> changeset attached the mux nodes before the controller nodes =E2=80=94
> i2c_del_adapter() blocks forever in
> wait_for_completion(&adap->dev_released), waiting for a reference that
> is only dropped later in the same teardown sequence.
>
> Teach fw_devlink about i2c-parent so the core creates the
> corresponding device links: consumers are unbound before the parent
> adapter's device, and probe ordering no longer needs -EPROBE_DEFER.
>
> A plain DEFINE_SIMPLE_PROP() cannot be used because the property has
> two incompatible layouts: the i2c mux bindings hold a list of bare
> phandles (i2c-demux-pinctrl takes several), while toshiba,tc9563 holds
> a single phandle followed by an i2c slave-address cell. The two forms
> are indistinguishable in the flattened tree, and a 0-cell parse of the
> tc9563 form would read the slave address as a phandle, linking the
> consumer to whatever node happens to carry that phandle value. Use a
> custom parser that only takes entry 0 for toshiba,tc9563 nodes.
>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
> Changes in v3:
> - Fix the tc9563 compatible check: match "pci1179,0623" (the actual
>   binding compatible) instead of "toshiba,tc9563", which never matched
>   and let the bare-phandle parser misread the i2c slave-address cell as
>   a phandle (Sashiko AI review)
> - Link to v2: https://patch.msgid.link/20260815-b4-of-property-add-i2c-pa=
rent-v2-1-239c6da9e097@nexthop.ai
>
> Changes in v2:
> - Use a custom parser instead of DEFINE_SIMPLE_PROP: toshiba,tc9563 puts
>   an i2c slave-address cell after the phandle, which a 0-cell parse
>   would misread as a phandle (Sashiko AI review, Rob). Kept the full

A bit of a tangent, is this a bug in Sashiko bot?
It just dropped me from the reply in the v1 patch set. Any idea why?

-Saravana

>   phandle-list parse for other users since i2c-demux-pinctrl takes
>   several parents; only tc9563 is limited to entry 0
> - Move the Signed-off-by into the commit message proper; v1 had it below
>   the '---' cutter line where it would be dropped on apply
> - Link to v1: https://patch.msgid.link/20260813-b4-of-property-add-i2c-pa=
rent-v1-1-a2487e920ce1@nexthop.ai
>
> To: Rob Herring <robh@kernel.org>
> To: Saravana Kannan <saravanak@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/of/property.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 72cf12907de0..9bf3bc0a5f38 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1471,6 +1471,22 @@ static struct device_node *parse_gpio_compat(struc=
t device_node *np,
>         return sup_args.np;
>  }
>
> +static struct device_node *parse_i2c_parent(struct device_node *np,
> +                                           const char *prop_name, int in=
dex)
> +{
> +       if (strcmp(prop_name, "i2c-parent"))
> +               return NULL;
> +
> +       /* tc9563 (pci1179,0623) is <phandle addr>; every other user is b=
are phandles */
> +       if (of_device_is_compatible(np, "pci1179,0623")) {
> +               if (index)
> +                       return NULL;
> +               return of_parse_phandle(np, prop_name, 0);
> +       }
> +
> +       return of_parse_phandle(np, prop_name, index);
> +}
> +
>  static struct device_node *parse_interrupts(struct device_node *np,
>                                             const char *prop_name, int in=
dex)
>  {
> @@ -1562,6 +1578,7 @@ static const struct supplier_bindings of_supplier_b=
indings[] =3D {
>         { .parse_prop =3D parse_resets, },
>         { .parse_prop =3D parse_leds, },
>         { .parse_prop =3D parse_backlight, },
> +       { .parse_prop =3D parse_i2c_parent, },
>         { .parse_prop =3D parse_panel, },
>         { .parse_prop =3D parse_msi_parent, },
>         { .parse_prop =3D parse_pses, },
>
> ---
> base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
> change-id: 20260813-b4-of-property-add-i2c-parent-168c6d7f1934
>
> Best regards,
> --
> Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
