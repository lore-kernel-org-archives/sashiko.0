Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABECA39BFEA
	for <sashiko@lists.linux.dev>; Fri,  1 May 2026 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777636030; cv=none; b=NmKSv8EfMdap5hOqZnSAPaje2Q7u7+ZrmJ5ypMXX8lxyoK9Q37INiXSkX021t9cJqBhzqqAVjFc3Q9SJDqZVeeNWF8pggojHkOshhHqgHG7Wu8eQ+2/PPdCcIu0jL5n4l69ZPPRORcDVK1fk9uFYO7hyMecPC7/2kZnqTNbONCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777636030; c=relaxed/simple;
	bh=M32ND7UT/YUYK1LWaU9B27qA0xTISbCF2pVBSKYmTPU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lR8Ar9eSISjQA6/mL0dj36I/P+5bw3VUh4jcC5zVj4l0eKRfdgMOu5BQJ3nhQaeBIJx2YaLGWwMeeWHTZGxs3mMm8RTceEF9Zki16q2MK3x2FCmLtQH3oezfXlvMYEaWAjX0iX0tKfkITITai2Fxk1y6v8I2fm+yiVnM5joSszw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=YiRADz6y; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="YiRADz6y"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E7813240101
	for <sashiko@lists.linux.dev>; Fri,  1 May 2026 13:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777636019; bh=tXxWKZpIprL3BWaq9HvxU2DBxf3/KtI7CNMkPw9isZg=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=YiRADz6y6pW7tJFTRE80P6lZcyKD/QLP2h1/+/6+ug8WXscJJhiY6CzL9KCt+Xhep
	 ErIVjVSRpm2vzKlY531U6ClbmjCj3xH98qrF11fRTMBExHPdaRGM8plY7zgJmrFhIJ
	 4Wu1MPQGS06w+zdU5N7FX9x3wiYpjs2NQCqUP2fgE9xjsChgY3B2ffwgYNy/zL9+Kl
	 ik782ePLyisPjD/PywnpfB9fDG5IwIyeN1EWrhtdSRzkKOhDafo7PvPi1qmVKLVvml
	 6qzd0aS1HuNzhOQc8mXvmnAZi/kqSva0tcHXV5sic7FJAnMKD14ZdnnvJP8DcgbCQk
	 lXLWV235kTWnw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g6Tm32Z1Nz9rxM;
	Fri,  1 May 2026 13:46:59 +0200 (CEST)
Message-ID: <d15b401322e571e8016e03984d70d15b613d54fa.camel@posteo.de>
Subject: Re: [PATCH v15 1/3] rust: leds: add basic led classdev abstractions
From: Markus Probst <markus.probst@posteo.de>
To: sashiko@lists.linux.dev
Cc: ojeda@kernel.org
Date: Fri, 01 May 2026 11:46:59 +0000
In-Reply-To: <20260429205646.91290C19425@smtp.kernel.org>
References: <20260429-rust_leds-v15-1-97e97b27ebb5@posteo.de>
	 <20260429205646.91290C19425@smtp.kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-LX+7HJdLOpezLYo0daYZ"
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-LX+7HJdLOpezLYo0daYZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-04-29 at 20:56 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] DeviceBuilder::name lifetime erasure causes Use-After-Free
> - [High] Unsound fwnode reference count management causes underflow and U=
se-After-Free
> - [High] Aliasing violation and Null pointer dereference (Undefined Behav=
ior) in blink_set_callback
> - [Medium] LedOps::brightness_get prevents propagating hardware errors
> --
>=20
> commit a78848106d199e2b6993093a6b1e1aad9d0557e7
> Author: Markus Probst <markus.probst@posteo.de>
>=20
> rust: leds: add basic led classdev abstractions
>=20
> This commit introduces basic Rust abstractions for the LED subsystem,
> including a LedOps trait for device operations, a DeviceBuilder to regist=
er
> class devices, and a safe wrapper Device around led_classdev.
>=20
> > diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
> > new file mode 100644
> > index 000000000000..6cbaa917deb4
> > --- /dev/null
> > +++ b/rust/kernel/led.rs
>=20
> [ ... ]
>=20
> > +impl<'a> DeviceBuilder<'a, Named> {
> > +    /// Sets the name of the led.
> > +    ///
> > +    /// Setting this will prevent the fwnode from being used and preve=
nts automatic name
> > +    /// composition.
> > +    #[inline]
> > +    pub fn name(self, name: &'a CStr) -> Self {
> > +        Self {
> > +            name: Some(name),
> > +            ..self
> > +        }
> > +    }
> > +}
>=20
> Is it possible for the name string to be freed while the C subsystem stil=
l
> holds a pointer to it? DeviceBuilder::name accepts a &'a CStr and assigns
> its raw pointer to the name field of bindings::led_classdev.
>=20
> Because Device<T> has no lifetime parameters, DeviceBuilder::build return=
s a
> Devres<Device<T>> that outlives the 'a lifetime.
>=20
> If a caller dynamically allocates a string, registers the device, and dro=
ps
> the string, the C subsystem might retain a dangling pointer in led_cdev->=
name
> since it does not copy the name when init_data is bypassed. This could le=
ad
> to a use-after-free when sysfs or led_classdev_unregister accesses the na=
me.
>=20
> [ ... ]
>=20
> > +    /// Gets the current brightness level.
> > +    fn brightness_get(&self, dev: &Self::Bus, classdev: &Device<Self>)=
 -> u32 {
> > +        let _ =3D (dev, classdev);
> > +        build_error!(VTABLE_DEFAULT_ERROR)
> > +    }
>=20
> Does this signature prevent Rust LED drivers from safely propagating hard=
ware
> read errors?
>=20
> The C callback brightness_get returns an enum led_brightness, which the C
> subsystem treats as an int capable of holding negative error codes like
> -EIO.
>=20
> Functions in the C core explicitly check for negative return values to
> gracefully handle hardware failures. Returning a u32 forces drivers to
> return bogus brightness values instead of an error. Could this be changed
> to return a Result<u32>?
Yes.
Bindgen interprets `enum led_brightness` as u32, so it will require
casting.

Only this issue is new. All other reports have already been dealt with
the last revision.

Thanks
- Markus Probst

>=20
> > diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
> > new file mode 100644
> > index 000000000000..b457ddb742c7
> > --- /dev/null
> > +++ b/rust/kernel/led/normal.rs
>=20
> [ ... ]
>=20
> > +    unsafe extern "C" fn blink_set_callback(
> > +        led_cdev: *mut bindings::led_classdev,
> > +        delay_on: *mut usize,
> > +        delay_off: *mut usize,
> > +    ) -> i32 {
> > +        from_result(|| {
> > +            // SAFETY: The function's contract guarantees that `led_cd=
ev` is a valid pointer to a
> > +            // `led_classdev` embedded within a `led::Device`.
> > +            let classdev =3D unsafe { Device::<T>::from_raw(led_cdev) =
};
> > +            // SAFETY: `classdev.parent()` is guaranteed to be contain=
ed in `T::Bus`.
> > +            let parent =3D unsafe { T::Bus::from_device(classdev.paren=
t()) };
> > +
> > +            classdev.ops.blink_set(
> > +                parent,
> > +                classdev,
> > +                // SAFETY: The function's contract guarantees that `de=
lay_on` points to a `usize`
> > +                // and is exclusive for the period of this function.
> > +                unsafe { &mut *delay_on },
> > +                // SAFETY: The function's contract guarantees that `de=
lay_off` points to a `usize`
> > +                // and is exclusive for the period of this function.
> > +                unsafe { &mut *delay_off },
> > +            )?;
>=20
> The C API permits callers to pass NULL for these arguments to request
> default blink delays. Would dereferencing a null pointer here to create a
> Rust reference cause immediate undefined behavior?
>=20
> Additionally, when the C core passes pointers to the blink_delay_on and
> blink_delay_off fields inside the led_classdev struct, the callback
> simultaneously creates an immutable reference &Device<T> to the entire
> struct.
>=20
> Does creating a mutable reference to a field while holding an immutable
> reference to the parent struct violate strict aliasing rules?
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
> Can this underflow the fwnode reference count if self.fwnode was None
> during device building?
>=20
> In DeviceBuilder::build, the code attempts to leak the FwNode reference b=
y
> calling core::mem::forget(self.fwnode). If self.fwnode was None, nothing =
is
> leaked.
>=20
> If the C driver core later automatically assigns an fwnode to the device,
> dev.fwnode() will return Some. This would cause PinnedDrop to construct a=
n
> ARef and drop it, decrementing a reference count that it never incremente=
d
> or owned.


--=-LX+7HJdLOpezLYo0daYZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmn0krIbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSmEEP/jg7+tKcSRIACij4pfic
8/W+aZsQRnF4R/RddWCAJqnP4knb/l3Wfl6QXCAVpr9Q7AJaBRZJ6M158xNfrUDT
0Fgwyw7nLrRgwoFOJEbq/vcTawo69/5IdG4OSUcb5Asb//MjFrGedab3WzAAXyeD
jrL4Bb0RUZyXqhhtmyvgZfrQKuAoAjngPCSSpyEN0IIw2gXqG5HOetndqMYuDYwT
AhbCrG3SNNdeJG2Qcvt4QbEqp3Qmt+PCt/teKc52oNHJcBZBvs++/JAm1B/4+xbL
BEe7ksjAhqmDpTsQt/oXNUQ0n09iyv6OSZPdpWSBLjjxua2zXPhqB4qG9gVqkiBU
ak+PydS9yBqCgZEgnBnGQ5kVJzXt8h90AJRUE1F5+Ap65eNea2NrkiWdqJ/t+gP2
Vwlanp41mlFBJt1R8PzvT+omCtov/7KsWgB+BR98JkRuRD/EklhufnkI3Fobtq1c
SWg/5Upsi5S4UkJ2EI59uIV5/9cpz3B+ztq4eMvvyXfpXNfqRMuxl6eSV3HX6YsS
plM4wM3fJ5w2PqhAoDzdT8kvzOZn1RlFi4rWekUBmE6p/5F7UPBkwbwBLteGgLPb
bFxJiqUujmXPY4T75se5zG9OBajKpujFECpEXO9r243iJj7V87XoJYlGdMhpBxex
y0AwzfE7G2djPA2PFF1Z8xxu
=6Mol
-----END PGP SIGNATURE-----

--=-LX+7HJdLOpezLYo0daYZ--
