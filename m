Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1D53D3483
	for <sashiko@lists.linux.dev>; Fri,  1 May 2026 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777651700; cv=none; b=i/MMk1zfDoct3z/cyBLCc/oZgGKHjXeZOkyGWyBeDD2c01qGW84V8y4pdQexYgayDts5zhtrmrb7TUWqsiYfbwfUj/XUf9PZfYF1/F6+QrbBx/ptdT5XSgBq+fIMluTzE2BDwcDQd013ma09ibdTXzmuGH0Ah2QdYmgVZI/rpHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777651700; c=relaxed/simple;
	bh=6aaomQ+OhQPay+pISROTUBdJ+jJ6hlPZCjy9FC9FD0I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LayQTd14dUte2aPiGv33sJgI8aR6NySr82XauEOPCuQLccGnyWI8LAuPf6mICQRDVObMkLfRNPcqJgQfR76XKN15zKOZLGJvDSoT6eBNzbsyD1ymizc9lQjXq5WUZocQH3/XMBuQCDU98N+uljZR9YKTGYNToCEBYl+jFtRZEts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=DAaG2oqJ; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="DAaG2oqJ"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 95CD2240101
	for <sashiko@lists.linux.dev>; Fri,  1 May 2026 18:08:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1777651685; bh=m6EvApq+7JWSREfrJSag81VNnvo91Ggn88JaREfrJ3Y=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=DAaG2oqJ4mjnCNIXbOdanfTxsOuBjbGb6s0d/lHHbbtCq7wkDKdjnqEMxJ2Q1/CMJ
	 xEGOLO2CGmtCR/cfzoPT5+Lz9oMF4YGohpNFUGQ9hcaNI/OHW/Z+b1S2/BTbZwE4nZ
	 svN31HOYy4ydvMuML4GHQqoZsbi4aO3R0CDE0lZLd94X7WrfZyksttdiNnu/vgqXZj
	 DOugvlvf2im+yVkMxvB39uhv62LRrpMY3v+uw2RzaYk7rUtNz8LvrpHD4lHGMyBkp8
	 O37z8shsxeYO0H4Cr4OKVtyQv3s3vFymo6PHWK6DTWAW1quLdC1XpNhd62krTRKlAH
	 Kx+pxn2ntjLog==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g6bYJ6mPsz6tw2;
	Fri,  1 May 2026 18:08:04 +0200 (CEST)
Message-ID: <5acf05eef36d1e521b65afdcbd27c1657ff6f88c.camel@posteo.de>
Subject: Re: [PATCH v16 3/3] rust: leds: add multicolor classdev abstractions
From: Markus Probst <markus.probst@posteo.de>
To: sashiko@lists.linux.dev
Cc: ojeda@kernel.org
Date: Fri, 01 May 2026 16:08:05 +0000
In-Reply-To: <20260501160050.A0206C2BCB4@smtp.kernel.org>
References: <20260501-rust_leds-v16-3-9f329fdedcd9@posteo.de>
	 <20260501160050.A0206C2BCB4@smtp.kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qc91zvvIoVsiXqUv+dvB"
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-qc91zvvIoVsiXqUv+dvB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-01 at 16:00 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [Critical] Information Leak and Array Out-of-Bounds via FFI Layout Mism=
atch
> - [High] Data Race and Undefined Behavior via Aliasing Violation on suble=
d fields
> - [High] Memory Leak and Use-After-Free via FwNode Reference Mismanagemen=
t
> - [High] Undefined Behavior and Memory Corruption via `KVec` Capacity Mis=
match
> - [Low] Missing `#[inline]` attribute on `MultiColorDevice::from_raw`
> --
>=20
> commit 519046430edb434e8aa4a9b617987bbaa0db6c71
> Author: Markus Probst <markus.probst@posteo.de>
> Subject: rust: leds: add multicolor classdev abstractions
>=20
> This commit implements the abstractions needed for multicolor led class
> devices. It provides types for the multicolor led mode, the subleds, and
> the device builder to register a new multicolor led class device.
>=20
> > diff --git a/rust/kernel/led/multicolor.rs b/rust/kernel/led/multicolor=
.rs
> > new file mode 100644
> > index 000000000000..900ef050d2d3
> > --- /dev/null
> > +++ b/rust/kernel/led/multicolor.rs
> > @@ -0,0 +1,405 @@
>=20
> [ ... ]
>=20
> > +#[repr(C)]
> > +#[derive(Copy, Clone, Debug)]
> > +#[non_exhaustive]
> > +pub struct MultiColorSubLed {
> > +    /// the color of the sub led
> > +    pub color: Color,
>=20
> Does this structure have an identical memory layout to the C mc_subled
> struct? The Color enum doesn't have a #[repr(u32)] or #[repr(C)]
> attribute, so the Rust compiler will likely size it as 1 byte.
>=20
> To align the subsequent brightness field, the compiler would insert 3 byt=
es
> of uninitialized padding.
>=20
> When the C LED core accesses mc_led_cdev->subled_info[i].color_index (whi=
ch
> is 4 bytes), could it read the 1-byte color value combined with the
> uninitialized padding? This might produce a large index on little-endian
> architectures, potentially leading to out-of-bounds reads when the C
> subsystem indexes arrays like led_colors.
Thats a new one.

false positive.
`Color` does have a #[repr(u32)].

Thanks
- Markus Probst

>=20
> [ ... ]
>=20
> > +    pub fn build_multicolor<T: LedOps<Mode =3D MultiColor>>(
> [ ... ]
> > +                    let mut subleds_vec =3D KVec::new();
> > +                    subleds_vec.extend_from_slice(subleds, GFP_KERNEL)=
?;
> > +                    let (subled_info, num_colors, capacity) =3D subled=
s_vec.into_raw_parts();
> > +                    debug_assert_eq!(num_colors, capacity);
>=20
> Could this assertion fail if the allocator sizes the allocation larger th=
an
> num_colors? extend_from_slice can yield a capacity strictly larger than
> the requested size.
>=20
> > +
> > +                    let subled_guard =3D ScopeGuard::new(|| {
> > +                        // SAFETY: `subled_info` is guaranteed to be a=
 valid array pointer to
> > +                        // `mc_subled` with the length and capacity of=
 `num_colors`.
> > +                        drop(unsafe { KVec::from_raw_parts(subled_info=
, num_colors, num_colors) });
> > +                    });
>=20
> Is it safe to reconstruct the vector with num_colors as the capacity?
>=20
> If extend_from_slice originally allocated a capacity greater than
> num_colors, passing a mismatched capacity back to the allocator during
> cleanup could lead to memory corruption.
>=20
> [ ... ]
>=20
> > +                    // SAFETY:
> > +                    // - `parent.as_ref().as_raw()` is guaranteed to b=
e a pointer to a valid
> > +                    //    `device`.
> > +                    // - `ptr` is guaranteed to be a pointer to an ini=
tialized `led_classdev_mc`.
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
> > +                    })?;
> > +
> > +                    subled_guard.dismiss();
> > +
> > +                    core::mem::forget(self.fwnode); // keep the refere=
nce count incremented
>=20
> Does this reliably transfer the reference count to the C subsystem?
>=20
> If self.name.is_some(), the init_data pointer is explicitly passed as
> NULL to led_classdev_multicolor_register_ext. This means the C device is
> never associated with the fwnode, and the reference count leaked here mig=
ht
> never be recovered since PinnedDrop uses dev.fwnode() to clean it up.
>=20
> Conversely, if self.fwnode was None initially, but the C device inherited
> an fwnode from its parent, would the PinnedDrop implementation reconstruc=
t
> an ARef from it and erroneously decrement a reference count it never owne=
d?
>=20
> [ ... ]
>=20
> > +impl<T: LedOps<Mode =3D MultiColor>> MultiColorDevice<T> {
> > +    /// # Safety
> > +    /// `led_cdev` must be a valid pointer to a `led_classdev` embedde=
d within a
> > +    /// `led::MultiColorDevice`.
> > +    unsafe fn from_raw<'a>(led_cdev: *mut bindings::led_classdev) -> &=
'a Self {
>=20
> This isn't a bug, but functions that are small or forwarding to a binding
> call should be annotated with #[inline].
>=20
> [ ... ]
>=20
> > +    /// Returns the subleds passed to [`Device::new_multicolor`].
> > +    #[inline]
> > +    pub fn subleds(&self) -> &[MultiColorSubLed] {
> > +        // SAFETY: The existence of `self` guarantees that `self.class=
dev.get()` is a pointer to a
> > +        // valid `led_classdev_mc`.
> > +        let raw =3D unsafe { &*self.classdev.get() };
> > +        // SAFETY: `raw.subled_info` is a valid pointer to `mc_subled[=
num_colors]`.
> > +        // CAST: The safeguards in the const block ensure that `MultiC=
olorSubLed` has an identical
> > +        // layout to `mc_subled`.
> > +        unsafe {
> > +            core::slice::from_raw_parts(
> > +                raw.subled_info.cast::<MultiColorSubLed>(),
> > +                // CAST: It is guaranteed that `num_colors` fits into =
an `usize`.
> > +                raw.num_colors as usize,
> > +            )
> > +        }
> > +    }
>=20
> Does returning a shared reference &[MultiColorSubLed] violate Rust's
> aliasing rules?
>=20
> The C LED subsystem can concurrently mutate the brightness and intensity
> fields of these subleds (e.g., in led_mc_calc_color_components or during
> sysfs writes).
>=20
> Mutating memory from C code while a Rust driver holds a shared reference
> could result in undefined behavior. Should these mutable fields be wrappe=
d in
> an Opaque<u32> to permit interior mutability?
>=20
> [ ... ]
>=20
> > +#[pinned_drop]
> > +impl<T: LedOps<Mode =3D MultiColor>> PinnedDrop for MultiColorDevice<T=
> {
> > +    fn drop(self: Pin<&mut Self>) {
> [ ... ]
> > +        // SAFETY: `subled_info` is guaranteed to be a valid array poi=
nter to `mc_subled` with the
> > +        // length and capacity of `led_cdev.num_colors`. See `led::Mul=
ticolorDevice::new`.
> > +        drop(unsafe {
> > +            KVec::from_raw_parts(
> > +                led_cdev.subled_info,
> > +                led_cdev.num_colors as usize,
> > +                led_cdev.num_colors as usize,
> > +            )
> > +        });
> > +    }
> > +}
>=20
> Similar to the error path above, could reconstructing this vector with
> led_cdev.num_colors as the capacity cause memory corruption if the origin=
al
> allocation capacity was larger?

--=-qc91zvvIoVsiXqUv+dvB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmn0z+QbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSWUwQAI/ZRGNalqCwSZeD+/zT
dpnsS+LMW5LPNo5FMctpBpXfwTBa3uGtjYirO2tiR/jdRf4Pn6UcA53MdJgGaeAy
Sf8zsYUUbIuIu0CiBHzsDJsvxwEPOVvq6jlh9SlOoWvofkUgqOWpkQa9aLtFeewX
SA0qZifkYj0CAACgvOT+f/aaszkzvvGBud9vtn3PLW7OQP+dV3UN4EWwtfc1+dol
ZwC0wcJZtzwncjKnD3TcXoEE9pvVUsZNbYI0FndtJmGmpQ/yYPmgb70NvSPeNeNq
uMKjysI1cBgrdXP3Y/VHcQ4dfiDyPC7WicEpgDQVFevHJYrXVVuLXVLqZYb+M86l
zh3QgAps/PHnfkfTZj3CkXlNo/J0/ZzpqxDk1OtrUDdA6p7Q/ceeycBctAvo5Kd+
YT/ztfwryj8tdlF5gJNmpKnJT5b+K+WA9LcmpisLmYyQYYdg6rI6S1jZWWYQ2tMq
hCp4T3yOrjZCf0Kl5lX6o6ChQqPenmnHvetPLsgZ1exZ2UfbbVhXUEtGLsM1Bnas
aFr9ZcRxCR4fc+prvPMo9eGjcbSpb3DY5eQo6YcLP2d+BRKRjvAqCbgWSB3B0icx
R3ujFxMf/LZ+l6RjSbulXGNyJlpphfvZf+AqIpINd0lpAaOhTJ3Iwvkdrcw2nglO
aS+IVhP9W32tZ6sWlW3rCxzM
=H468
-----END PGP SIGNATURE-----

--=-qc91zvvIoVsiXqUv+dvB--
