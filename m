Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2850A37BE6C
	for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 15:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476306; cv=none; b=H4pECxtWCTqZ7lCwLiRaSyVDZ7WaM49wjLZ8RyYUTmJMa49MmlBs6EgoXhXY+G+3OXmuqIvdG4ubYkfL1CHgf/IWsZELBIWWHGQ1ROShcG0q4ooTPw4Hhr9l/JUpReqZ4FdD3IaKyxH8f7Rpg0o78QJJPlkTZfWUrQoMhQE9a98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476306; c=relaxed/simple;
	bh=WSTX0XtVoz4uUkvUcRjoFUD5IKyK0I2C1Xy5EfyObcY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BO+4+0y7LcSjHxV0kIpma9/7zkng/W9PVIFTaSNG2bQ1PCG31fATiP1rN6qrXZeCkdKizanI0/RmbmetrvEIknTzUJ1M6Z5cvgHRghaJ67H4Grb6b/F8MkJOGXFJFQsB4BAgCWAZ4kkfj8b7jJ60VRwh7P4dRaEFI+Yqvr+HgR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=MFSyuLIN; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="MFSyuLIN"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 06D60240104
	for <sashiko@lists.linux.dev>; Wed, 29 Apr 2026 17:25:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777476301; bh=acI2PySx4uRdQ10ByrSnwjfjqsVdE7Ysn+Wwo/tH9Ns=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=MFSyuLIN/bhiuBobpDAEP2aXQipccbUSmsGi6Es4YcOrK/hfp2j3rXSutBCtFdACC
	 1iZEzUAlNt7Rf3K2uAFG8Dw31kc1ExtmKpNMHJNuUtdmB4lpdwzYCvcOCUzPvOjQzA
	 s3Yff51sdu2eF4RxWuL18SjXGmwIvJIimQueP/KMQ82gYGOHwKilixFLyfV2DahX7E
	 HNIJwC7ZOEW+HaW4H6nnvmwvfKGtQJ6whwuckGo6VE9A4NqQxWrUriUBhY+7IvKpxv
	 oz2cIEX0S7jPkrDbNLhx3iALg9UiqznwwClFGPGLKR802NfIuY2//dmSfyx1gCUKcq
	 qgfr5IF/RkCUw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g5LhX24rQz6tw2;
	Wed, 29 Apr 2026 17:25:00 +0200 (CEST)
Message-ID: <9f8a02ff0bf1096e468770eb5d1cd411a29fdef9.camel@posteo.de>
Subject: Re: [PATCH v14 3/3] rust: leds: add multicolor classdev abstractions
From: Markus Probst <markus.probst@posteo.de>
To: sashiko@lists.linux.dev
Cc: ojeda@kernel.org
Date: Wed, 29 Apr 2026 15:25:00 +0000
In-Reply-To: <20260427220110.AEAFDC19425@smtp.kernel.org>
References: <20260427-rust_leds-v14-3-4f4b17e5d516@posteo.de>
	 <20260427220110.AEAFDC19425@smtp.kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YaSZT5GF7sihG1sqYXbh"
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-YaSZT5GF7sihG1sqYXbh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-04-27 at 22:01 +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 5 potential issue(s):
> - [Critical] `MultiColorDevice::subleds` returns an immutable slice to pl=
ain data concurrently mutated by C code, causing an aliasing violation and =
Undefined Behavior.
> - [High] Incorrect `KVec` capacity tracking causes Undefined Behavior, an=
d an early return causes a memory leak.
> - [High] The `fwnode` reference is permanently leaked (and may cause unde=
rflow on a different node) if a device name is explicitly set.
> - [High] Creating exclusive mutable references to `delay_on` and `delay_o=
ff` in `blink_set_callback` violates mutable aliasing rules.
> - [Low] Subsystem guidelines regarding `#[inline]` annotations and import=
 formatting are violated.
> --
>=20
> commit c95f500a2f1b623bcca663aa0589f4b833fe42ae
> Author: Markus Probst <markus.probst@posteo.de>
>=20
> rust: leds: add multicolor classdev abstractions
>=20
> Implement the abstractions needed for multicolor led class devices,
> including led::MultiColor and safe wrappers around led_classdev_mc
> and mc_subled.
>=20
> > diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
> > index e8a69efd3066..8ec95c4f230c 100644
> > --- a/rust/kernel/led.rs
> > +++ b/rust/kernel/led.rs
> [ ... ]
> >  #[cfg(CONFIG_LEDS_CLASS_MULTICOLOR)]
> >  pub use multicolor::{MultiColor, MultiColorDevice, MultiColorSubLed};
>=20
> This isn't a bug, but does this import follow the vertical import style
> mandated by the Rust subsystem coding guidelines?
It is a public export, so it may be special. I will add fix it anyways.

>=20
> > diff --git a/rust/kernel/led/multicolor.rs b/rust/kernel/led/multicolor=
.rs
> > new file mode 100644
> > index 000000000000..726fdaf068cb
> > --- /dev/null
> > +++ b/rust/kernel/led/multicolor.rs
> [ ... ]
> > +impl MultiColorSubLed {
> > +    /// Create a new multicolor sub led info.
> > +    pub const fn new(color: Color) -> Self {
>=20
> This isn't a bug, but shouldn't small abstraction functions like new(),
> channel(), and initial_intensity() be annotated with #[inline] to comply
> with the subsystem guidelines?
Yes.

>=20
> [ ... ]
> > +                    let mut subleds_vec =3D KVec::new();
> > +                    subleds_vec.extend_from_slice(subleds, GFP_KERNEL)=
?;
> > +                    let (subled_info, num_colors, capacity) =3D subled=
s_vec.into_raw_parts();
> > +                    debug_assert_eq!(num_colors, capacity);
> > +
> > +                    // SAFETY: `try_ffi_init` guarantees that `ptr` is=
 valid for write.
> > +                    // `led_classdev_mc` gets fully initialized in-pla=
ce by
> > +                    // `led_classdev_multicolor_register_ext` includin=
g `mutex` and `list_head`.
> > +                    unsafe {
> > +                        ptr.write(bindings::led_classdev_mc {
> > +                            led_cdev: bindings::led_classdev {
> [ ... ]
> > +                            num_colors: u32::try_from(num_colors)?,
>=20
> If u32::try_from(num_colors) fails, does this early return leak the memor=
y
> allocated for subled_info?
Very unlikely event, but yes. In the case that it is greater than
`u32::MAX`, there is a memory leak.

>=20
> The inspect_err closure responsible for cleaning up the allocation is
> attached to the register_ext call further down, which wouldn't be reached
> if the try_from conversion evaluates to an error.
>=20
> [ ... ]
> > +                    to_result(unsafe {
> > +                        bindings::led_classdev_multicolor_register_ext=
(
> > +                            parent.as_ref().as_raw(),
> > +                            ptr,
> > +                            if self.name.is_none() {
> > +                                &raw mut init_data
> > +                            } else {
> > +                                core::ptr::null_mut()
> > +                            },
> > +                        )
> > +                    })
> > +                    .inspect_err(|_err| {
> > +                        // SAFETY: `subled_info` is guaranteed to be a=
 valid array pointer to
> > +                        // `mc_subled` with the length and capacity of=
 `num_colors`.
> > +                        drop(unsafe { KVec::from_raw_parts(subled_info=
, num_colors, num_colors) });
> > +                    })?;
>=20
> Could reconstructing the vector this way cause undefined behavior?
>=20
> The capacity returned by into_raw_parts() is discarded earlier, and the
> vector is rebuilt here with a hardcoded capacity of num_colors. Since
> extend_from_slice() can over-allocate, passing an incorrect capacity back
> to the allocator violates safety contracts.
On the first allocation, length always equals capacity. But I agree it
isn't a perfect solution.

>=20
> > +
> > +                    core::mem::forget(self.fwnode); // keep the refere=
nce count incremented
>=20
> Does this leak the fwnode reference if self.name is explicitly set?
No, because it happens on an Option type.

>=20
> When self.name.is_some(), core::ptr::null_mut() is passed to register_ext
> above, so the C device never associates with the fwnode. However,
> core::mem::forget(self.fwnode) is called here unconditionally.
>=20
> During PinnedDrop, the code attempts to drop the reference by calling
> dev.fwnode(). Since the device was never given the fwnode, this might
> return None and leak the reference, or return an inherited fwnode, which
> would cause a reference count underflow on the wrong node.
>=20
> [ ... ]
> > +    pub fn subleds(&self) -> &[MultiColorSubLed] {
>=20
> This isn't a bug, but shouldn't this small abstraction function also be
> annotated with #[inline]?
Yes.
>=20
> Additionally, can returning an immutable slice of plain data here lead to
> undefined behavior?
>=20
> The C subsystem can concurrently modify the underlying brightness and
> intensity fields (for example, led_mc_calc_color_components modifies
> brightness, and multi_intensity_store modifies intensity).
>=20
> Because MultiColorSubLed defines these as plain u32 fields rather than
> wrapping them in UnsafeCell or Opaque, the Rust compiler assumes they
> will never change while the immutable reference exists. This violates str=
ict
> aliasing rules and could lead to data races.
I don't think there is any quick way to avoid this.

>=20
> [ ... ]
> > +    unsafe extern "C" fn blink_set_callback(
> > +        led_cdev: *mut bindings::led_classdev,
> > +        delay_on: *mut usize,
> > +        delay_off: *mut usize,
> > +    ) -> i32 {
> > +        from_result(|| {
> [ ... ]
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
> Is it safe to create exclusive mutable references to delay_on and delay_o=
ff
> in this context?
Yes.
>=20
> These pointers point directly to the shared led_cdev->blink_delay_on and
> led_cdev->blink_delay_off fields in the C struct.
Only with the timer trigger and the timer trigger only sets it directly
on the pointer if it is happening on a sysfs store call.

>=20
> If the sysfs interface reads these fields concurrently, such as through
> delay_on_show, it would violate Rust's strict mutable exclusivity guarant=
ees
> and result in undefined behavior.
Afaik sysfs blocks any "show" function calls during this time.


--=-YaSZT5GF7sihG1sqYXbh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmnyIssbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSN60QAJ14e3UKIz3/UYQVevqs
esPmtCwfxR/1MtrCSBdeqIFvArzzd09Xk5j7QS+q8CeJRX64pW17nbC8gRuDoKwN
jvwnThVNEPVmUVpOqmwATQNjYP/RYgAr0D6y++dxqwk6FSaf8xS5/Ixxr1bs8N3W
ueF/BtmVWEQpWGtQYPjJnZPBFAwf5gG8ornafwpJ13Yvhop9QXH19pFfiYX64ZVf
9qytNprpVb0tWaPIVLWTLXQcRm9em0uQiMepyJh+AW8M533w2YmfqLSGiHmw51tk
XKsvLBv1oNwLnj1yEmna6Ypnxp5ePfQQ+T++EkBFR3gMKhImMSKSizs1sZjSmVWz
yhMLTDxZDHJt/GtqvRtMQCkjc+D4RCAOSJD/0CWchJdtVlfqyns6xIHzMHaKL40c
PAFtV+jR6dC8QXydWt0yqWZvyehRemd7VGs9CLixQCCQMhIWEt13LUjCLaOjqii9
UNFRzLjKuabuayObABpJVP03TQOXK3Py/jyHB9mJpupgTNHsakxz4j431Oxw2eFM
eBDtlyF807baEEQoky5ObKdnG1k5p7Fs2mG4FZXmf1rhawzD8p8JYcXC+hnuM+T7
eD7EQpxohWAoOmWXqP8FKrYxJ41JE5HYhd8HIOhAsKE1J2ZH1FZdkPmzidWGLJjC
fQxOLu+QZxqFc1bNQ79HLJGa
=yymD
-----END PGP SIGNATURE-----

--=-YaSZT5GF7sihG1sqYXbh--
