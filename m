Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC8735FF6E
	for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777473397; cv=none; b=UdDGa8pM9kh/Z+Q+u3gf8guQFRmIs1i21ez2HymbwAg4KnIf0xLXW0dA4ec2SRY4psIXxiswERqi0ZwKu9Yjfl0iNmVBNooHlkKt/HkuZRegVW8l1deG62tRAA2CHIjrnLYSsh2rBbI5bFvhGgBvZc31KeNN3RDezKnVXWsrx6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777473397; c=relaxed/simple;
	bh=1gT2TV7Z4aA8N9HstVOUFmlM4XOgUeKS78HrFjJRw8M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QDqnLqzSebJezXjAVv9pQamG1PN4aXIHPHKMETwj2x01C+amdCbWjJ2xVhJtlhTVSA5G6QYKxrlnzLkrb5W/WC2XTfdMDdppEN2Ky4Crny1mQFWWbT0IXZ1hgIAJurLOcPaGXRZjYjp/cF1f+7hJL4cMCCY03ixy3bXbDxNxKKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=O4XXXMf+; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="O4XXXMf+"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id AB849240101
	for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 16:36:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777473385; bh=dEsFfF+ayMOv0tBU40vlbsr4W2BC3eDF6C3v/4HKk0c=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=O4XXXMf+Ga08m2G1rDtMhSHwUYVVECXzHAhNBuLfsyrmU1Hp92LTqiZeu3SbsJ06l
	 qazG9WfksCI6idrSDz7NDFd3BYmn7URpMoy/Il3SjdFx+sd1Pync8Olvbj/iHET5pR
	 q33Jg4srbpHQKfIQpHuB+2b+tpHSYCA7GS7LzmbYeH3FXOWVietXAP2R2vRN/oc7EP
	 ExQ/aT2DZmTmopelnv524ypM9FMQlZ+WDK7R0rpyPiG7rY8WX3N5v9F1YGKp0pafmz
	 xS6Kl9sj3lEjSIiqGhxTkQYJqDbbYBm8fEL3EOeY6k5h0VZbD1lha2LChaL0a5OJ2+
	 SF/C+s2af7rTg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g5KcT00PVz9rxB;
	Wed, 29 Apr 2026 16:36:24 +0200 (CEST)
Message-ID: <e450383a9721d8a12eb51190595c854a67af5d45.camel@posteo.de>
Subject: Re: [PATCH v14 1/3] rust: leds: add basic led classdev abstractions
From: Markus Probst <markus.probst@posteo.de>
To: sashiko@lists.linux.dev
Cc: ojeda@kernel.org
Date: Wed, 29 Apr 2026 14:36:25 +0000
In-Reply-To: <20260427212050.EDA40C2BCB6@smtp.kernel.org>
References: <20260427-rust_leds-v14-1-4f4b17e5d516@posteo.de>
	 <20260427212050.EDA40C2BCB6@smtp.kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-V7jHl0ra9W1uEdFigrgL"
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-V7jHl0ra9W1uEdFigrgL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-04-27 at 21:20 +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 4 potential issue(s):
> - [Critical] Unsound fwnode reference count management leads to refcount =
underflow and Use-After-Free.
> - [Critical] Lifetime erasure in `DeviceBuilder` allows dangling string p=
ointers in the C structure (Use-After-Free).
> - [High] Missing `Sync` bound on `LedOps` allows data races and undefined=
 behavior.
> - [Low] Missing `#[inline]` annotations on small forwarding abstraction f=
unctions.
> --
>=20
> commit 919a1118f74d7259424462187e0643f2925bb6d6
> Author: Markus Probst <markus.probst@posteo.de>
>=20
> rust: leds: add basic led classdev abstractions
>=20
> Implement the core abstractions needed for led class devices. This includ=
es
> the LedOps trait for handling LEDs, the DeviceBuilder to construct the
> device, and a safe wrapper around led_classdev.
>=20
> > diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
> > new file mode 100644
> > index 000000000000..f371ba48ef12
> > --- /dev/null
> > +++ b/rust/kernel/led.rs
>=20
> [ ... ]
>=20
> > +#[vtable]
> > +pub trait LedOps: Send + 'static + Sized {
> > +    /// The bus device required by the implementation.
>=20
> The LED subsystem frequently invokes led_classdev callbacks concurrently =
from
> multiple threads without locks. For example, led_trigger_event() calls
> led_set_brightness() locklessly within an RCU read-side critical section.
>=20
> If LedOps only requires Send and lacks a Sync bound, could a driver
> implement this trait using types with non-thread-safe interior mutability
> (like core::cell::Cell), resulting in data races?
If BLOCKING is false, concurrent access to `LedOps` is indeed possible.

>=20
> [ ... ]
>=20
> > +impl Color {
> > +    /// Name of the color.
> > +    pub fn as_c_str(self) -> &'static CStr {
> > +        // SAFETY:
>=20
> This isn't a bug, but the Rust subsystem coding guidelines require small
> forwarding abstraction functions to be annotated with #[inline]. Could th=
is
> attribute be added here?
I suppose yes.

>=20
> > diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
> > new file mode 100644
> > index 000000000000..bd239f186c64
> > --- /dev/null
> > +++ b/rust/kernel/led/normal.rs
>=20
> [ ... ]
>=20
> > +/// The led class device representation.
> > +///
> > +/// This structure represents the Rust abstraction for a led class dev=
ice.
> > +#[pin_data(PinnedDrop)]
> > +pub struct Device<T: LedOps> {
> > +    #[pin]
> > +    ops: T,
> > +    #[pin]
> > +    classdev: Opaque<bindings::led_classdev>,
> > +}
> > +
> > +impl<'a, S: DeviceBuilderState> DeviceBuilder<'a, S> {
> > +    /// Registers a new [`Device`].
> > +    pub fn build<T: LedOps>(
> > +        self,
> > +        parent: &'a T::Bus,
> > +        ops: impl PinInit<T, Error> + 'a,
> > +    ) -> impl PinInit<Devres<Device<T>>, Error> + 'a {
>=20
> Since the Device struct does not carry a lifetime parameter, does the ret=
urn
> type impl PinInit<Devres<Device<T>>, Error> + 'a fail to prevent the call=
er
> from dropping the strings provided for the name and default_trigger field=
s?
>=20
> The C subsystem retains these pointers indefinitely. If a caller passes a
> dynamically allocated string (like a CString), registers the LED, and
> drops the string, couldn't this lead to a use-after-free when the kernel
> later accesses led_cdev->name or led_cdev->default_trigger?
This is true for `default_trigger`, but not for `name`.

led_cdev->name will be copied on register and only has to be valid
until the registration finishes.

I will remove `default_trigger` as I don't see a use for it at the
current moment.

>=20
> [ ... ]
>=20
> > +impl<T: LedOps> Device<T> {
> > +    /// # Safety
> > +    /// `led_cdev` must be a valid pointer to a `led_classdev` embedde=
d within a
> > +    /// `led::Device`.
> > +    unsafe fn from_raw<'a>(led_cdev: *mut bindings::led_classdev) -> &=
'a Self {
>=20
> This isn't a bug, but the Rust subsystem coding guidelines require small
> forwarding abstraction functions to be annotated with #[inline]. Could th=
is
> attribute be added here?
>=20
> [ ... ]
>=20
> > +    fn parent(&self) -> &device::Device<Bound> {
> > +        // SAFETY: `self.classdev.get()` is guaranteed to be a valid p=
ointer to `led_classdev`.
>=20
> This isn't a bug, but could the #[inline] attribute be added here as well=
?
>=20
> [ ... ]
>=20
> > +#[pinned_drop]
> > +impl<T: LedOps> PinnedDrop for Device<T> {
> > +    fn drop(self: Pin<&mut Self>) {
> > +        let raw =3D self.classdev.get();
> > +        // SAFETY: The existence of `self` guarantees that `self.class=
dev.get()` is a pointer to a
> > +        // valid `led_classdev`.
> > +        let dev: &device::Device =3D unsafe { device::Device::from_raw=
((*raw).dev) };
> > +
> > +        let _fwnode =3D dev
> > +            .fwnode()
> > +            // SAFETY: the reference count of `fwnode` has previously =
been
> > +            // incremented in `led::Device::new`.
> > +            .map(|fwnode| unsafe { ARef::from_raw(NonNull::from(fwnode=
)) });
>=20
> In DeviceBuilder::build(), core::mem::forget(self.fwnode) is called, whic=
h
> transfers ownership of the reference count if a node was explicitly
> provided.
>=20
> However, the core kernel can automatically assign a fwnode to the device
> during registration (for example, device_platform_notify() may assign an
> ACPI companion node).
>=20
> If self.fwnode was None but the kernel assigned a node automatically, won=
't
> this unconditional ARef::from_raw() incorrectly decrement a reference cou=
nt
> the driver never incremented, resulting in an underflow and use-after-fre=
e?
false positive.

`device_platform_notify` calls 2 functions:
  - `acpi_device_notify`:
    only assigns fwnode to *bus devices*. This is a led class device.
  - `software_node_notify`:
    does not change the fwnode

--=-V7jHl0ra9W1uEdFigrgL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnyF2cbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSj+0QAL3VaO4VARLwkRvKr3yW
FrcDBynOJiLAeBiLS4UWhO5vNiwXN/KG0r5fgr6zyaxhyBgXSuESwFG7Sc5y3cTe
Xzeqw/j4QEBKlHqmdA1u4ha4QyOdlj+dibjtHhootHiEahj4dMZDlhRQwSbinzJq
XKM5vKlfO1v30eWyfZhLtMSfcaY5T6Yx5QXteRbNWSCMqZBe+bdFQkPDGwY3KFnF
n6h5xmMDWzqDnkyy3wMsTMeXqTQdUTOlUeDLlI0DgTE4fQzmLSI6kqCEe6IM2IK3
/Kf3YJwso2THJR+9ydLAM/Q2eEtaxhak969b0PjYZRibvNM/rYT16xjtrJIBxeAS
m3c2Y0hvJ1c00Egdq/aRjUi9xygrf/lFZQ7d3xP7M86x+jBqTFEMrBDaV0F/Gxoz
kTUHpC/51dMPHF8tVyTcyNjVi2AAHMxgfuu6/gZfkzxtUTg9ABzCB+tx40z7jz1w
RNoZi3EVm4iDpEIk7PV2w9nne8bPEMwUfgN66xuXvw6fk9zXbPnGS1ujAoTaSTto
B6KSzbsmfAyA2KT7dPS1/GFad28AhlGY4S9yMX7sZIcpozjj+jbIihkUt+Q2S+/r
x0AQPBIR/dZ0p7xhq4ltYzwfdOSrhDyyAltCrOVumZta21hGc/2mZ4auh+92pr0O
uYGLQZs9T1WuSJbdBAGfT+fV
=R3kr
-----END PGP SIGNATURE-----

--=-V7jHl0ra9W1uEdFigrgL--
