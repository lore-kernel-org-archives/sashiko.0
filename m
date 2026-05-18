Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C2038E124;
	Mon, 18 May 2026 19:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779133229; cv=none; b=IWhy6HUXgiMaBENGlXRY6rXg9VPGoStvR1YfiB+t8n0Do5o9JXL5fz8Fk4Jc+8MOlKDqSCkxD2ttEMrYH/jJRGYxJKTbhnAEENQtvoPg9mNAKl43eUa6DYZ4k2XCeDmIqCcFoBK/kYSazouGY8Fi+6gbMSq1t4dvhoBMk/P+0Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779133229; c=relaxed/simple;
	bh=Lj2y6Z/5yB8RGF1dZj4AOFVgzx3lRYityrUd9Yu85wY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cXlvikDSbJl9TE+oHWPpUa0xeFFeBqUAtknl7z1CftX2/T5PGFK7c0tnrNmk2P/PHpVB4v+9MDIvToVL7puy/wybb04jJ6hAfYuEvP2c1KyaThvW5mwHWT/musB+Rv7DjdADMiqPVWOfHEA4eC19Vh/OSZ4PSV2HLpo6bo02D70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKnDeAtu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKnDeAtu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68AD2C2BCB7;
	Mon, 18 May 2026 19:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779133228;
	bh=Lj2y6Z/5yB8RGF1dZj4AOFVgzx3lRYityrUd9Yu85wY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JKnDeAtu/QV8Ha15MCZOZm/ucdQ/st7/AJB6NHDPW4+2YAIGegtsUIIttkbKhWg8w
	 iXCh99HSSN7QsxV5QcE7XIQEFGLpjAHfh/5jG5Zyy3sFK+0ORwTQsahxWbNlds+aXs
	 PlVcVj/BD9CPnqdfZlVW4Mbx0ODreKQLuOsh70CVr2JJ2rTvOhTJmdptdh2lJ2UFWz
	 gb5VByelsFgfYSTgvVOWubD5Owf5Ftxo7agFcGAJ4D8y/V3VIhmtY5B5SdbNoo8cy9
	 uzIUJTDwTmhtW9HF7y2VpE6vvfLTph8u9k5jddf4k+3apv64gYD9uLUPu1O1BDSPiX
	 KgJL4SuTZw21A==
Date: Mon, 18 May 2026 21:40:22 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Theodore Tso" <tytso@mit.edu>
Cc: Jani Nikula <jani.nikula@intel.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Krzysztof Kozlowski <krzk@kernel.org>,
 debarbos@redhat.com, Arnaldo Carvalho de Melo <acme@kernel.org>, Greg KH
 <gregkh@linuxfoundation.org>, Konstantin Ryabitsev <mricon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev, Linux Kernel
 Workflows <workflows@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 kfree@google.com
Subject: Re: Stop false review statements
Message-ID: <20260518214022.5f94f917@foz.lan>
In-Reply-To: <20260518121601.GA87957@macsyma-wired.lan>
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
	<07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev>
	<2e20badf27b6910d619329841e37d2961556056f@intel.com>
	<20260518121601.GA87957@macsyma-wired.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 18 May 2026 08:16:01 -0400
"Theodore Tso" <tytso@mit.edu> wrote:

> On Mon, May 18, 2026 at 11:04:29AM +0300, Jani Nikula wrote:
> > > Sashiko is supporting various LLMs, including open models - it=E2=80=
=99s just a practical
> > > choice: to my knowledge the quality of open models is not on par with=
 frontier closed
> > > models and it would require a non-trivial amount of hardware and infr=
astructure to run
> > > an open model at the required scale. =20
> >=20
> > In the context of the "Reviewed-by: Sashiko" discussion, this actually
> > makes it really hard to assess the quality of those reviews. =20
>=20
> Agreed.  There's a reason why the coding-assistants.rst specifies the
> model which is used:
>=20
>   Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
>=20
> The problem is that (as Jon has pointed out) coding-assistants.rst was
> intended for use when the tool was beging used to help create the code
> --- that is, "Coding Assistants".  What we're doing here is more of a
> reviewer assistance.  Something like:
>=20
>   Scanned-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
>=20
> Would be more interesting, but it doesn't actually tell us anything
> about what the results were of the scan.

I don't like scanned-by, even for a tool that would always get the
same results like checkpatch. For LLM, this is even worse, as two runs
may give different results for the same code.

IMO what makes much more sense is to add information there when
a change was done due avoid a problem detected by sashiko, and what
was the fixed issue, e.g. a textual description like:

	Changed locking schema after Sashiko's report report about
	XXX race condition.

Also, except if 100% of the=20

> One of the problems here is that there is a distinction between the
> infrastructure and review prompts in the Sashiko github repository,
> and the reviews that are being published by Sashiko the web service
> being run by Google that is being lost by some folks.  So I wonder if
> for now, we should just do something like:
>=20
> Link: https://sashiko.dev/#/patchset/20260515091829.194810-1-me%40linux.b=
eauty

Adding a link makes sense to me. It doesn't need to be to the
sashiko's email though: it can be to the entire thread.

> Or just have a link to lore where the review has responded to the
> Sashiko review stating where the Sashiko review reported a
> pre-existing condition (perhaps one that we don't care about because
> races in readahead logic is really Not A Big Deal, etc.)  We go for
> this strategy, it would actually be better for the Shashiko.dev review
> to get cc'ed to the mailing list.
>=20
> Personally, I think that's probably be best way to go.  We already
> don't insert into the git commit an explanation of why some bullsh*t
> review by some wannabe human reviewer should be ignored, or why a
> discussion of some problem discovered by a human review in the source
> of the review would be handled in a future patch set.  That's what the
> discussion on lore.kernel.org is for.  And we shouldn't treat AI
> reviews any different from how we deal with human reviews.  So if we
> want to give credit to an AI review, then let's go with the
> Scanned-by.=20

If the entire content of a Sashiko review is ignored, I don't think
it is worth adding anything. Just like we do with humans, IMO the
best is to just mention what changed due to some feedback received
by a human or by a bot, mentioning who/what bot helped to identify
the issue.

> Or we can just let people look at the mailing list, and
> if people want to have statistics, we can ask people to use a script
> running against public inbox to figure things out.
>=20
> 						- Ted
>=20



Thanks,
Mauro
