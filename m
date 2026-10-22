Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792649723;
	b=CBMXduhgXmWt2Kpdetz2gL5h38oa77WjYqMrPaDfboJXx+ZHp8SKpnRDVZxuWxC0nIgZ
	 v2NCpqrdTyL9ZvlDv/tbDB11Ey2JGrJmEncXnAiIll2UG2DaEpL6zt3V+A2nd42sAH0jO
	 jWKJcR+XChkCuKqtBhbArZARBIYaHUW/tC2C0l4X8X5/zXWR+PSizkuDtDfjLVtjqItj+
	 agxxVZXzTUxHaSJXjwvRuKW5Ufrpfl+pG0uiV4C5NJIyKCHeRTRLRcwlGmT0hn3U6Ux/1
	 AXDcrBF7+gPwaGOep6Gz2Re758tdbiL2djB0Y92PB3XzxoU/UUAU4qgj4MEf75nQD3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GMsqs+V5sy6eusb8/1fMPt8auTZbZLdQVauX29CTHxQ=;
	b=tkipXRWSfFKuhZuP3xYI8KajWllhNIXMewd/nz0u0SDPoLj5BrQSsVdXl6onnUKM9rSq
	 0DdbxtuBksGWOPCTVIGdFvSd/rGhM+NsVNjntMzYp1Ny+1+KnBwdiuWoH7k86fpHqo3kk
	 jH04tEMAUvrErT7DDg7quGhhdT0rCD9SrROikn4lGfg91b41Lk1i6Ebkv2cfl23FPLUok
	 OmDxXQbh6KSXSZ8XUWbYGOesueCrb1pCLMfom2IYjR7T9k8vrm1dvJJ+iwpS5s6gaD8YI
	 CiGhH8jE80888M5aJQ3WkABT38jz+rXP57jTdm2vM0au+nPtTqYgNHeilIIpkUKok2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CYI2Y3a7;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4A8606A31F
	for <sashiko@lists.linux.dev>; Thu, 22 Oct 2026 06:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F4A8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CYI2Y3a7
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so1268305e9.1
        for <sashiko@lists.linux.dev>; Wed, 21 Oct 2026 23:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792649721; x=1793254521; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMsqs+V5sy6eusb8/1fMPt8auTZbZLdQVauX29CTHxQ=;
        b=CYI2Y3a7+lccza/x6nkg7ty6kj73bw0eJ0HlxpKHW12IEWKclg5TWIQomMqIT7Cte3
         D+Vx4WH0b2i+gkgFdQkk2q5gvxxpKH9wvOeC8v5oO+Td8/vT4kmMs0HwI0jmBGP6dJl6
         a6PQUsGjFmQZ3A9YeD7ILgwE5WiwfBiOcLlucLOCanJBI0HW7dqCE3U/8gbXIR2eSQc9
         AsIaE41qr4gIW9xV9qq95P7C12VA3FvWukLQUE3QeCyXLA8JOcvPz/lteLIBz1deZsZW
         yiaQxuss6GNoxpMWeUeQnWEYr+RfJfQVYTrkR7/WrcDcWVYt14Q3m3az0C5Uz6KhhE6Q
         0gCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792649721; x=1793254521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMsqs+V5sy6eusb8/1fMPt8auTZbZLdQVauX29CTHxQ=;
        b=wQZT9/fVMFLaY/eEFcGFbmF3jueTVON2sjXM4LchOihpae8dsxfiGhbrntuz6CPGOJ
         OfCyDVaYAQIDKmOpTjNxH372259KfRQ5NuL6wRTx1xXtiGPL249VnbnG2oWNdQaA0p9k
         aL7VIhBIfX55/vU4iFo43s6cLbuOeZfEMGCx8M4xwhRqQ0PZWjOSk2i63dqzJ4Dmvqrt
         5b6VZduUtKAkjCqkzGZsmP7e6bYZVQb1yi1EkCFIFEcihXjSmX5KmW7fEMrxQk4jYBxN
         dE/mcWTb9YX87nvatkIL2BKJajSLc66X7PKBSIkNFkIFnpMYjougU9abWdQEjE2PH6wi
         67eg==
X-Forwarded-Encrypted: i=1; AKwUvBxqoV8q8eNJOpDOgZNd8Bz66HM+xE4RiXLzcqrfbnVbooUd1lrylWcbad13Lq2nmtEY3trPlL1Y@lists.linux.dev
X-Gm-Message-State: AFq9FYI3lxcW6ezFYTDvy0slnRMvPe+1diXDN2BAQXuitO5nprCZ691x
	SCZI6bGT+/xr97JptcmQwXUWQalTs++dsZt3bEiNp/e+oxo94IPZ2GBbv9VXhdixZWgW6BkF
X-Gm-Gg: AYBFou3n+gXCG9ssQ4IV3Ya/eAGKrqdYjPTyy5NIVQ2f/mMqIqYx8Zb6CRjledezf7o
	SGWb8y+skRGCbEUVfarozurqQqNfXmMu7ozDWUgWu8MbT/myS1D/uxjA56AMzUgLNhuNmOzxLjp
	Ci6JvnqndkV/BJAx4rPQ4OLC9w/SAhj3PV175X0ifAE+/qPyqwYlzAIkQOZwswsG4njcP615dbK
	8pHXjKMEkXp0FO5fqQIg+mn7BcT4/DeQQYxxuAbizdvvK4VV095YeESS79bqWlaX82sck85/nbj
	UqOj0iUtI9XZml/es0qBlRSWjnqiwL72IuVvmYWIev6hqAL86Dxl2L0k9gdswZaZOSyMGPwMdtw
	Vz7jSdET03cp+v39zUE4tHlASpz8pWNAaBliZePinpVD4dfLB15xl4RCEFd03e3CdqNnZYBD7TH
	3CRiiKfn6h1Od+V1YXDsVgOdWRJLLv/NQoe5ppMW6I/gnZPbiz4ykvOlAS6DxyNrJohz2SdMycQ
	uD+lS+YJ71p6TemBJP88ASncS17ZbG9wLdcCZAUPBAHmGWboBtm
X-Received: by 2002:a05:600c:c093:b0:4a2:317:d0ed with SMTP id 5b1f17b1804b1-4a204a8f5b1mr19867815e9.1.1792649720655;
        Wed, 21 Oct 2026 23:15:20 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd56732fsm19856945e9.3.2026.10.21.23.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:15:19 -0700 (PDT)
Date: Thu, 22 Oct 2026 09:15:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Theodore Tso <tytso@mit.edu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bart Van Assche <bvanassche@acm.org>,
	johannes.goede@oss.qualcomm.com, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, sashiko@lists.linux.dev
Subject: Re: Patch pre-submission to Sashiko
Message-ID: <atmp71xbWnADcbS3@stanley.mountain>
References: <atO3pCuUxI950ftN@mit.edu>
 <3354ebda-5158-489b-a577-5cb10e5d5fb0@oss.qualcomm.com>
 <atZ4J86j7CXF82HX@mit.edu>
 <2fef166e-088d-4ffe-8d0a-0143aebc1b26@acm.org>
 <ate8oESqneK-3sQJ@mit.edu>
 <7e473af8-2f7a-4a36-a926-e756873c9c52@linuxfoundation.org>
 <atic3bbDeyJI6MJs@sirena.co.uk>
 <atjlUoEmTagZjrYI@mit.edu>
 <atjpS__OwjZ-Q_Fh@sirena.org.uk>
 <20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Post: <mailto:sashiko@lists.linux.dev>
List-Help: <mailto:sashiko+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021114524.4c2ea2a31a9d527b78e78768@linux-foundation.org>

It would be good if there was an automated way to collect these throw
away tests.  Something like `cat email.txt | extract_tests.pl`.  QC
systems could run the tests against different arches or configs.  And
we'd just keep on running them until the test breaks at which point we
either notify people or delete the test if it was a bug in the test.
We wouldn't spend time trying to fix the tests themselves.

That sort of thing might useful for training AI and code coverage as
well.

regards,
dan carpenter

