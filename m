Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537C3C13F1
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 11:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031940; cv=none; b=lyN8YUZPObzrJjrBjkQdBzac54llh1me3rGa8Luda7GlBYNl+KFj+EJ/VjwVRlJcuT+kGYK9H9F9W2bJX6/C4AsvEEOyf32j7mAZP+jaAWvGQTJ+5BeC7y+M8bApbfITdI2rSuuUQhQZN7Zwp7Op9hqAwZxpUyAg9Wf7innhh54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031940; c=relaxed/simple;
	bh=WrywqqSHucZYIAKlSOs8uKu8f4vTIp0zqoVC7ES0CIw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Awtkf7AsEGefFmxCvsa3+YBxHOSN08WBUrhbQ06IJgRL6O2vEwRj3dPfIZINSb66yLKOZpYCVSqPq8n8LMi+qLrCuAPZRu1PsiO67S9//+nignn5COsan+YQpMsGXQS21IWfW7TeTZOwWqpa7hfTyUXMxSSU4K/D89sz7T8t/xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=J3ZkJoxB; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="J3ZkJoxB"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1B8CA240027
	for <sashiko@lists.linux.dev>; Fri, 24 Apr 2026 13:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777031936; bh=oa7+6Zl6wb77qgkMK4WK+HiHaWnbiRYgVR/MsfcTKxQ=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=J3ZkJoxBVwdOaN8lXnKnUJPWtIuxJM/LRMDS+VZ2EQITv3YB9QpuMOyXrwJg+8Xsx
	 UwBBJ8p0k7DfLjQLeoX8bDJNSim9aoy/WUyoIN102GETdgU9QvXjB2q3kjgV0H16Nh
	 RLUlxOCUQaHaqrdkFwl+XSwt2sFBjwCWSOv9VKiOqm6fEPyFBZ2dOrTuWsLJWmKmGW
	 ALxl9NU87xhgi4E07V+zCSJAZu5AqXWbxvNCfcWakR9Q7y0JMDgijNsaGhhuq4odiw
	 X32MqrcLVGEsGyq+64SPFwgEJopUtxA4IFPh7g2rgamTbgf7IKYuUsq4Kox6KvfGFC
	 2kOQDImOVI+Ng==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g2BM343cyz6tvm;
	Fri, 24 Apr 2026 13:58:55 +0200 (CEST)
Message-ID: <9c4cd34c8ba47f1cb432dff521382c0dc4717476.camel@posteo.de>
Subject: Re: [PATCH v9 2/2] platform: Add initial synology microp driver
From: Markus Probst <markus.probst@posteo.de>
To: sashiko@lists.linux.dev
Cc: ojeda@kernel.org
Date: Fri, 24 Apr 2026 11:58:55 +0000
In-Reply-To: <20260423215810.3516CC2BCB2@smtp.kernel.org>
References: <20260423-synology_microp_initial-v9-2-4a8533f87e07@posteo.de>
	 <20260423215810.3516CC2BCB2@smtp.kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-rdg0awbzci57GpcLO7KK"
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-rdg0awbzci57GpcLO7KK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-23 at 21:58 +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 7 potential issue(s):
> - [Critical] Use-After-Free of the dynamically allocated Alert LED CStrin=
g.
> - [High] Logic errors in LED brightness control prevent clearing the hard=
ware blink state.
> - [High] Use-After-Free of `power_name` during teardown due to incorrect =
struct field declaration order.
> - [High] Concurrent accesses to the shared serdev bus are not serialized,=
 leading to corrupted command sequences.
> - [Medium] The SYNOLOGY_MICROP config depends on a non-existent symbol RU=
ST_SERIAL_DEV_BUS_ABSTRACTIONS.
> - [Medium] Typo in the compatible string for the DS223 model prevents dri=
ver binding.
> - [Low] Missing Device Tree Binding YAML file referenced in MAINTAINERS.
> --
Since this is an AI reply, I am not sure if I am supposed to reply to
it. Anyway, the answers:

>=20
> commit 47c26ce6bffc3c75c3df285181d595c18b827e6e
> Author: Markus Probst <markus.probst@posteo.de>
>=20
> platform: Add initial synology microp driver
>=20
> Add a initial synology microp driver, written in Rust. The driver targets
> a microcontroller found in Synology NAS devices.
>=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25546,6 +25546,13 @@ F:	drivers/dma-buf/sync_*
> >  F:	include/linux/sync_file.h
> >  F:	include/uapi/linux/sync_file.h
> > =20
> > +SYNOLOGY MICROP DRIVER
> > +M:	Markus Probst <markus.probst@posteo.de>
> > +L:	platform-driver-x86@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/embedded-controller/synology,ds91=
8p-microp.yaml
>=20
> Is this YAML file missing from the patch? It doesn't appear to be include=
d
> in the commit, which will cause Device Tree binding checks to miss the ne=
w
> schema.
It was added in the previous patch.

>=20
> > diff --git a/drivers/platform/synology_microp/Kconfig b/drivers/platfor=
m/synology_microp/Kconfig
> > --- /dev/null
> > +++ b/drivers/platform/synology_microp/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config SYNOLOGY_MICROP
> > +	tristate "Synology Microp driver"
> > +	depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
> > +	depends on RUST_SERIAL_DEV_BUS_ABSTRACTIONS
>=20
> Does RUST_SERIAL_DEV_BUS_ABSTRACTIONS exist anywhere in the tree?
>=20
> Depending on a non-existent symbol causes a silent build failure where th=
e
> dependency can never be satisfied, rendering the driver unbuildable.
Its in the serdev dependency of the patch.

>=20
> > diff --git a/drivers/platform/synology_microp/command.rs b/drivers/plat=
form/synology_microp/command.rs
> > --- /dev/null
> > +++ b/drivers/platform/synology_microp/command.rs
> [ ... ]
> > +impl Command {
> > +    pub(crate) fn write(self, dev: &serdev::Device<Bound>) -> Result {
> > +        dev.write_all(
>=20
> Does this code prevent concurrent writes to the serial bus?
>=20
> If user space modifies the state of multiple LEDs concurrently, the LED
> subsystem will invoke their callbacks simultaneously. Without a shared lo=
ck
> protecting the single serdev::Device instance, the multi-byte command
> sequences can become interleaved and corrupt the serial protocol.
If I send it as one buffer, I expect it to be sent in this order, even
if another thread trys to do the same.

Even if the whole buffer is not accepted at once. serdev internally
locks a mutex.

>=20
> > diff --git a/drivers/platform/synology_microp/led.rs b/drivers/platform=
/synology_microp/led.rs
> > --- /dev/null
> > +++ b/drivers/platform/synology_microp/led.rs
> [ ... ]
> > +#[pin_data]
> > +pub(crate) struct Data {
> > +    #[pin]
> > +    status: Devres<led::MultiColorDevice<StatusLedHandler>>,
> > +    power_name: CString,
> > +    #[pin]
> > +    power: Devres<led::Device<LedHandler>>,
> > +}
>=20
> Does this struct declaration order create a use-after-free during driver
> unbind?
>=20
> In Rust, struct fields are dropped strictly in declaration order. Because
> power_name is declared before power, its backing string buffer is freed
> before the Devres destructor unregisters the LED from the C subsystem.
>=20
> This creates a time window where the active led_classdev holds a dangling
> pointer to its name.
The CString is only ever used on register and is copied by the led
subsystem. The field does not have to outlive the `led::Device`.

>=20
> [ ... ]
> > +impl Data {
> > +    pub(super) fn register<'a>(
> > +        dev: &'a serdev::Device<Bound>,
> > +        model: &'a Model,
> > +    ) -> impl PinInit<Self, Error> + 'a {
> > +        pin_init_scope(move || {
> > +            if let Some(color) =3D model.led_alert {
> > +                let name =3D CString::try_from_fmt(fmt!("{}:alarm", co=
lor.as_c_str().to_str()?))?;
> > +                devres::register(
> > +                    dev.as_ref(),
> > +                    led::DeviceBuilder::new().color(color).name(&name)=
.build(
>=20
> Could this leak a dangling pointer to the LED subsystem?
>=20
> The name variable is strictly local to this if let block. When the block
> ends, the string is dropped and its backing memory is freed, but the kern=
el's
> LED framework expects the name string pointer to remain valid for the
> lifetime of the device.
The CString is only ever used on register and is copied by the led
subsystem. The field does not have to outlive the `led::Device`.

>=20
> [ ... ]
> > +    fn brightness_set(
> > +        &self,
> > +        dev: &Self::Bus,
> > +        _classdev: &led::Device<Self>,
> > +        brightness: u32,
> > +    ) -> Result<()> {
> > +        let mut blink =3D self.blink.lock();
> > +        (self.command)(if brightness =3D=3D 0 {
> > +            *blink =3D false;
> > +            State::Off
> > +        } else if *blink {
> > +            State::Blink
> > +        } else {
> > +            State::On
> > +        })
>=20
> If brightness is non-zero, shouldn't this disable any active blinking and=
 set
> the LED solidly ON?
>=20
> Evaluating else if *blink when brightness > 0 means the LED continues to
> blink and the internal boolean flag is never cleared.
No, only brightness =3D 0 disables blinking.
>=20
> [ ... ]
> > +    fn blink_set(
> > +        &self,
> > +        dev: &Self::Bus,
> > +        _classdev: &led::Device<Self>,
> > +        delay_on: &mut usize,
> > +        delay_off: &mut usize,
> > +    ) -> Result<()> {
> > +        let mut blink =3D self.blink.lock();
> > +
> > +        (self.command)(if *delay_on =3D=3D 0 && *delay_off !=3D 0 {
> > +            State::Off
>=20
> Should this path also reset *blink to false when blinking is explicitly
> stopped?
You are right on this one.

>=20
> [ ... ]
> > +    fn brightness_set(
> > +        &self,
> > +        dev: &Self::Bus,
> > +        classdev: &led::MultiColorDevice<Self>,
> > +        brightness: u32,
> > +    ) -> Result<()> {
> > +        let mut blink =3D self.blink.lock();
> > +        if brightness =3D=3D 0 {
> > +            *blink =3D false;
> > +        }
> > +
> > +        let (color, subled_brightness) =3D if classdev.subleds()[1].in=
tensity =3D=3D 0 {
> > +            (StatusLedColor::Green, classdev.subleds()[0].brightness)
> > +        } else {
> > +            (StatusLedColor::Orange, classdev.subleds()[1].brightness)
> > +        };
> > +
> > +        Command::StatusLed(
> > +            color,
> > +            if subled_brightness =3D=3D 0 {
> > +                State::Off
> > +            } else if *blink {
> > +                State::Blink
> > +            } else {
> > +                State::On
> > +            },
>=20
> Similarly, does this fail to turn a blinking LED solidly ON when the
> brightness is non-zero? It looks like it will just keep blinking because =
the
> blink state isn't cleared.
No, only brightness =3D 0 disables blinking.
>=20
> > diff --git a/drivers/platform/synology_microp/synology_microp.rs b/driv=
ers/platform/synology_microp/synology_microp.rs
> > --- /dev/null
> > +++ b/drivers/platform/synology_microp/synology_microp.rs
> [ ... ]
> > +        // rtd1619b
> > +        (DeviceId::new(c"synolody,ds223-microp"), Model::new().led_usb=
_copy()),
>=20
> This isn't a bug, but there's a typo in the vendor prefix ("synolody"). T=
his
> will prevent the driver from matching the device tree node for the ds223.
Yes, that is not supposed to be there.

Thanks
- Markus Probst

--=-rdg0awbzci57GpcLO7KK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnrWvQbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPS0wMP/i5ZzCynEx69I1+I8tNa
GmU/6JgfjGQIS8VTEjeZPnhlScj+XTtZpMZZA3sOahsDpjR2hMWXHdhy4MHtI/81
kMErwVgTMZx8LP26t/4TI06dHcyalgYRcp4h5lSUP9Nfp9LASNL5phAURdys++4p
Kw5xQgb2pGYCKlPlX5QG2hd1iOvUdarBAVTtIZT1y0SlUgG1SSR7DIDkBQixHgnT
AJthCJQ+BRRP+sxMBquqAvyEU87Z9PpoPyiZf4CcOrFnDmLdMI6+Wf6cLRtAK655
NSky73ADQVps7CVMz54qFbFioUHwNUZstM0+/tr8rshdhl5crofqfxVvzqzDRUwx
tIY+miLEtR56w2V/wj7guxzs3VCC0NnLdI4IncYoaUg0vKN0kOPtPHyF/YLFCQzw
tbO7zrRFdTRYYQX8/ldTV6fbHQ44qw1leMe/lI4/JPRT9AYA4PTBHm8zNrDAyByA
vk6y2OICfbyeuXFgqLafyl5JW02s6P2VYs2zCIYb7t1szKwc99yGSPOhNzWN8Nn3
X+w5ZpGmW3O1FxNjdJZjuSenjvK5U5KCXMNJ5M5SaJfCjYH+jhppNCEBYopjM7Ov
W01aIaiDv2vC1nfzXgEiRcWP8U5isAx1uP7U79ah3jjmL0FIfntyhKC5hG82CfiC
abdzONaptTqcjlob2b/0BRmh
=ffPI
-----END PGP SIGNATURE-----

--=-rdg0awbzci57GpcLO7KK--
