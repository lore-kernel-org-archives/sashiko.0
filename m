Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5380725A359
	for <sashiko@lists.linux.dev>; Thu, 23 Apr 2026 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776955080; cv=none; b=Me1yJbTwo74/JRA1zWczbQcDwnDKrF0j4VGoVACOVGlsN9zuvTWXiktXJWYZaW6ReOHlSBrNxoRtulQRteDFKwKIujEiGX3JKTA/i16/QdtRIcJ7LJV9D5mqUCe17CmTa6sVH/np6KofPWg0I1vVBefJjtZ6tweM/Ry/954Dx3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776955080; c=relaxed/simple;
	bh=bmpCH+66TNgDUiHXoRESq8ZYVgfmqmiUobEbMKtiOTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hn+lTCLDh7c/usurtNQK5vXJVuLSRtDPLxWM6jfnL0QDAYw55VdAZYGjMBsQwRkQt0nRGG9qaQ+IQMKirowzht1JxdyI6p7hBUmDqusFvqiBnU45snkMiL7pmG73SiCmoEOXBVpsSyzRUmtuT/AIfkza+DOr7u0SMs+qGTAKhng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RXqPgS7z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RXqPgS7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776955076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmpCH+66TNgDUiHXoRESq8ZYVgfmqmiUobEbMKtiOTA=;
	b=RXqPgS7zuBM6Diu0es6kOITnraM9M02b0JE/6jkLbMn9VCxF+tQn9ejS4IFkVQT9xApZzw
	PKg7CEGhTVewnprmYYWzq7GwNGCrmbc7aHLtKy2JnXDpIU4DP9CdkO8lfOjtnXaJAxk+RB
	eonh/tVgYDYCOq7TX5pI91QZrT9CPO4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-Ba1ZSD-IOBSsAfQaosmL7g-1; Thu,
 23 Apr 2026 10:37:47 -0400
X-MC-Unique: Ba1ZSD-IOBSsAfQaosmL7g-1
X-Mimecast-MFC-AGG-ID: Ba1ZSD-IOBSsAfQaosmL7g_1776955064
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2BED819560A2;
	Thu, 23 Apr 2026 14:37:44 +0000 (UTC)
Received: from [10.22.64.201] (unknown [10.22.64.201])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 22F5A196B8F6;
	Thu, 23 Apr 2026 14:37:42 +0000 (UTC)
Message-ID: <dbad8115-2f39-4a03-8eaf-6651d5507a8f@redhat.com>
Date: Thu, 23 Apr 2026 10:37:42 -0400
Precedence: bulk
X-Mailing-List: sashiko@lists.linux.dev
List-Id: <sashiko.lists.linux.dev>
List-Subscribe: <mailto:sashiko+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/23] sched/core: Use RCU to protect access of
 HK_TYPE_KERNEL_NOISE cpumask
To: sashiko@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, linux-hwmon@vger.kernel.org,
 hannes@cmpxchg.org
References: <20260421030351.281436-14-longman@redhat.com>
 <20260422030902.4F95FC2BCB0@smtp.kernel.org>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260422030902.4F95FC2BCB0@smtp.kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 0AF0I0oMZmEaW-izqjvn23KtMS-dOM-QWWpzNRjHFfE_1776955064
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiA0LzIxLzI2IDExOjA5IFBNLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0KPiBT
YXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKToNCj4gLSBbSGlnaF0g
VGhlIGNvbW1pdCBtZXNzYWdlIGluY29ycmVjdGx5IGNsYWltcyB0aGF0IGBob3VzZWtlZXBpbmdf
Y3B1bWFzaygpYCB3aWxsIHdhcm4gaWYgdXNlZCBpbiBhbiBpbnZhbGlkIGNvbnRleHQsIG1hc2tp
bmcgcG90ZW50aWFsIFJDVSBzYWZldHkgdmlvbGF0aW9ucyBlbHNld2hlcmUgaW4gdGhlIGtlcm5l
bC4gU3BlY2lmaWNhbGx5LCBgaG91c2VrZWVwaW5nX2RlcmVmZXJlbmNlX2NoZWNrKHR5cGUpYCBy
ZXR1cm5zIGB0cnVlYCBmb3IgYEhLX1RZUEVfS0VSTkVMX05PSVNFYCwgY2F1c2luZyBgcmN1X2Rl
cmVmZXJlbmNlX2FsbF9jaGVjaygpYCB0byBieXBhc3MgdGhlIGByY3VfcmVhZF9sb2NrX2hlbGQo
KWAgdmFsaWRhdGlvbi4gVGhpcyBmYWxzZSBhc3N1bXB0aW9uIG9mIGEgc2FmZXR5IG5ldCBsZWQg
dGhlIGF1dGhvciB0byBtaXNzIHVucHJvdGVjdGVkIGFjY2Vzc2VzLCBzdWNoIGFzIHRoZSBgaG91
c2VrZWVwaW5nX3Nob3dgIHN5c2ZzIGhhbmRsZXIgaW4gYGRyaXZlcnMvYmFzZS9jcHUuY2Agd2hp
Y2ggZG9lcyBub3QgaG9sZCBgcmN1X3JlYWRfbG9jaygpYC4gQmVjYXVzZSBgaG91c2VrZWVwaW5n
X3VwZGF0ZSgpYCByZXBsYWNlcyBhbmQgZnJlZXMgdGhlIG9sZCBtYXNrIHZpYSBga2ZyZWUoKWAg
YWZ0ZXIgYHN5bmNocm9uaXplX3JjdSgpYCwgY29uY3VycmVudCBleGVjdXRpb24gb2YgYGhvdXNl
a2VlcGluZ19zaG93KClgIHJlc3VsdHMgaW4gYSBVc2UtQWZ0ZXItRnJlZS4gV2hpbGUgdGhlIGxv
Y2tkZXAgb21pc3Npb24gaXMgcGF0Y2hlZCBsYXRlciBpbiB0aGUgc2VyaWVzIGJ5IGNvbW1pdCAi
c2NoZWQvaXNvbGF0aW9uOiBFeHRlbmQgaG91c2VrZWVwaW5nX2RlcmVmZXJlbmNlX2NoZWNrKCkg
dG8gY292ZXIgY2hhbmdlcyBpbiBub2h6X2Z1bGwgb3IgbWFuZ2VkX2lycXMgY3B1bWFza3MiLCB0
aGUgdW5kZXJseWluZyBVc2UtQWZ0ZXItRnJlZSB2dWxuZXJhYmlsaXR5IGluIGBkcml2ZXJzL2Jh
c2UvY3B1LmNgIHJlbWFpbnMgdW5maXhlZCB0aHJvdWdob3V0IHRoZSBlbnRpcmUgc2VyaWVzLg0K
PiAtLQ0KPg0KPiBjb21taXQgN2E3NzRiMzZmOWQ5YjQzMGJmNzE3MTUzNGI1M2Y2MTQ1NTU2ZjQ4
Mw0KPiBBdXRob3I6IFdhaW1hbiBMb25nIDxsb25nbWFuQHJlZGhhdC5jb20+DQo+DQo+IHNjaGVk
L2NvcmU6IFVzZSBSQ1UgdG8gcHJvdGVjdCBhY2Nlc3Mgb2YgSEtfVFlQRV9LRVJORUxfTk9JU0Ug
Y3B1bWFzaw0KPg0KPiBUaGlzIGNvbW1pdCBhZGRzIFJDVSBwcm90ZWN0aW9uIHRvIHRoZSBIS19U
WVBFX0tFUk5FTF9OT0lTRSBjcHVtYXNrIGluDQo+IGdldF9ub2h6X3RpbWVyX3RhcmdldCgpLCBh
cyB0aGUgbWFzayBjYW4gbm93IGJlIGNoYW5nZWQgYXQgcnVudGltZS4gSXQNCj4gYWxzbyBub3Rl
cyB0aGF0IGhvdXNla2VlcGluZ19jcHVtYXNrKCkgd2lsbCB3YXJuIGlmIHVzZWQgaW4gYW4gaW52
YWxpZA0KPiBjb250ZXh0Lg0KPg0KPj4gQXMgSEtfVFlQRV9LRVJORUxfTk9JU0UgaXMgZ29pbmcg
dG8gYmUgY2hhbmdlYWJsZSBhdCBydW4gdGltZSwgdXNlDQo+PiBSQ1UgdG8gcHJvdGVjdCBhY2Nl
c3MgdG8gdGhlIGNwdW1hc2sgd2hlbiBuZWVkZWQuIFNvbWUgYWNjZXNzIG9mIHRoZQ0KPj4gSEtf
VFlQRV9LRVJORUxfTk9JU0UgY3B1bWFzayBpcyBkb25lIGluc2lkZSB0aGUgdGljayBjb2RlIHRo
YXQgaGFzDQo+PiBpbnRlcnJ1cHQgZGlzYWJsZWQgd2hpY2ggaXMgYSByY3VfcmVhZF9sb2NrKCkg
Y3JpdGljYWwgc2VjdGlvbi4gQW55d2F5LA0KPj4gaG91c2VrZWVwaW5nX2NwdW1hc2soKSB3aWxs
IHdhcm4gaWYgdGhleSBhcmUgdXNlZCBpbiBpbnZhbGlkIGNvbnRleHQuDQo+IElzIHRoaXMgZGVz
Y3JpcHRpb24gYWNjdXJhdGU/IExvb2tpbmcgYXQgaG91c2VrZWVwaW5nX2RlcmVmZXJlbmNlX2No
ZWNrKCksDQo+IGl0IHJldHVybnMgdHJ1ZSBmb3IgSEtfVFlQRV9LRVJORUxfTk9JU0UsIHdoaWNo
IGNhdXNlcw0KPiByY3VfZGVyZWZlcmVuY2VfYWxsX2NoZWNrKCkgdG8gYnlwYXNzIHRoZSByY3Vf
cmVhZF9sb2NrX2hlbGQoKSB2YWxpZGF0aW9uLg0KPiBUaGlzIG1lYW5zIGxvY2tkZXAgd2lsbCBu
b3Qgd2FybiBhYm91dCBtaXNzaW5nIFJDVSByZWFkIGxvY2tzIGZvciB0aGlzDQo+IHNwZWNpZmlj
IG1hc2suDQoNClRoZSBjaGFuZ2UgdG8gZW5hYmxlIHByb3BlciBsb2NrIHByb3RlY3Rpb24gY2hl
Y2tpbmcgZm9yIA0KSEtfVFlQRV9LRVJORUxfTk9JU0UgaXMgbWFkZSBpbiBhIGxhdGVyIHBhdGNo
IGFmdGVyIGFsbCB0aGUgUkNVIGd1YXJkcyANCmFyZSBwcm9wZXJseSBhZGRlZC4NCg0KPg0KPiBC
ZWNhdXNlIHRoZSBtYXNrIGNhbiBub3cgYmUgcmVwbGFjZWQgYW5kIGZyZWVkIGR5bmFtaWNhbGx5
IGFmdGVyDQo+IHN5bmNocm9uaXplX3JjdSgpLCBkb2VzIHRoaXMgaW50cm9kdWNlIGEgdXNlLWFm
dGVyLWZyZWUgaW4gb3RoZXIgcmVhZGVycw0KPiB0aGF0IGRvbid0IGhvbGQgdGhlIFJDVSByZWFk
IGxvY2s/DQo+DQo+IEZvciBleGFtcGxlLCBob3VzZWtlZXBpbmdfc2hvdygpIGluIGRyaXZlcnMv
YmFzZS9jcHUuYyByZWFkcyB0aGlzIG1hc2sgdG8NCj4gcHJpbnQgaXQgdG8gc3lzZnM6DQo+DQo+
IGRyaXZlcnMvYmFzZS9jcHUuYzpob3VzZWtlZXBpbmdfc2hvdygpIHsNCj4gICAgICAuLi4NCj4g
ICAgICByZXR1cm4gc3lzZnNfZW1pdChidWYsICIlKnBibFxuIiwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICBjcHVtYXNrX3ByX2FyZ3MoaG91c2VrZWVwaW5nX2NwdW1hc2sodHlwZSkpKTsNCj4g
fQ0KPg0KPiBTaW5jZSBob3VzZWtlZXBpbmdfc2hvdygpIGRvZXNuJ3QgaG9sZCByY3VfcmVhZF9s
b2NrKCksIGNvdWxkIGEgY29uY3VycmVudA0KPiB1cGRhdGUgb2YgdGhlIGNwdW1hc2sgY2F1c2Ug
Y3B1bWFza19wcl9hcmdzKCkgdG8gYWNjZXNzIGZyZWVkIG1lbW9yeT8NCj4NCj4gV2hpbGUgdGhl
IGxvY2tkZXAgb21pc3Npb24gaXMgcGF0Y2hlZCBsYXRlciBpbiB0aGlzIHNlcmllcyBieSB0aGUg
Y29tbWl0DQo+ICJzY2hlZC9pc29sYXRpb246IEV4dGVuZCBob3VzZWtlZXBpbmdfZGVyZWZlcmVu
Y2VfY2hlY2soKSB0byBjb3ZlciBjaGFuZ2VzDQo+IGluIG5vaHpfZnVsbCBvciBtYW5nZWRfaXJx
cyBjcHVtYXNrcyIsIHRoZSB1bmRlcmx5aW5nIHVzZS1hZnRlci1mcmVlDQo+IHJlZ3Jlc3Npb24g
aW4gZHJpdmVycy9iYXNlL2NwdS5jIGFwcGVhcnMgdG8gcmVtYWluIHVuZml4ZWQgdGhyb3VnaG91
dCB0aGUNCj4gc2VyaWVzLg0KPg0KVGhhdCBpcyBtaXNzZWQgaW4gdGhlIGN1cnJlbnQgc2VyaWVz
LiBXaWxsIGZpeCB0aGF0IGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCkNoZWVycywNCkxvbmdtYW4N
Cg0K

