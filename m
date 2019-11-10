Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4115FF6A3A
	for <lists+linux-nfc@lfdr.de>; Sun, 10 Nov 2019 17:37:52 +0100 (CET)
Received: from new-ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 4F788100EA636;
	Sun, 10 Nov 2019 08:39:51 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com; envelope-from=ricardo.ribalda@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 4FDAB100EA636
	for <linux-nfc@lists.01.org>; Sun, 10 Nov 2019 08:39:49 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id v8so11193604ljh.5
        for <linux-nfc@lists.01.org>; Sun, 10 Nov 2019 08:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DVzDQroaxH54wFzz23JEQC9LJMACPiW8Irl/MK2h3hM=;
        b=OYsMpMLUOSKyZUrZUutyZXW3JnEXsWpvP0ZK32BzcWNZCkG+1J+2FA2Lr+RM0zjHum
         OI4WRRL0PezgGHftuA4TOdVwdiA9H+/XCNBgzLoeEdTI84bFPlNdR6cMty5LD3Bgjomq
         VqAX0QtrpVcRQ/JZoLB3yMjR57ghJVJRGxCas6pt3qdPS2R79Jz2Yt+rHEiB+JMSCyiw
         /5ngZeNz0XqQIRbCwPG/Vmj4aMg1YVXH98arDYRcA8wsOrRDJEFrvlbj0wbd5xOi1NTU
         MumkKzMxlmTuBB12y2Vynkyp0tFwyyT3ZSe/3+TM9pHJu5AzAIkxFziwLnh2lINDrydG
         lxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DVzDQroaxH54wFzz23JEQC9LJMACPiW8Irl/MK2h3hM=;
        b=UqRHeEBZaOqVUCGCfjSCg/ZVv+jcITXqF/P3N4MugUMpgCG2NVhLkyKwq0e3Vry1Nv
         k9ZpHVAY/xM/YBL3czzrs4fAaxizhmGqjeas/XbIzm6Y2RKjLCwMUj0lSitQ04EZE9Rj
         LEGkFcLDxGUGH7/OpiEDynzv0N9jgs838J4JTCoVloK6z8KdJtbwDbG3V7a9xWTtkw3U
         VedIlz2qoWT6z4PpQu4thzPy6sQoMQhCUBmDozBVvxfiBdP0AQUlbiOAKi59MpodgxzW
         dhX2kEW4kchjxDVhSjQqZSutVB4CylhD+KhqgyUB8+QSjjtcMN56A4lSruccW3rKNdcx
         AKNg==
X-Gm-Message-State: APjAAAUhsHHMhLNjDA9ZiSmNLxf26wgyrAkKCAcPvjehOpeOn9L7Q/W3
	7togW+p+wNkYoo/ylgMgWWKWRSiGbXLWqEfpc5w=
X-Google-Smtp-Source: APXvYqx1sCqGo1CSRQDFidNFy9fMc9OOVRWyMZv2BUy18o3JAxgxh4dPebXxKaq/9K5iMr3Blu72mTjKJ9vTXJbCYjk=
X-Received: by 2002:a2e:2903:: with SMTP id u3mr13490589lje.131.1573403865923;
 Sun, 10 Nov 2019 08:37:45 -0800 (PST)
MIME-Version: 1.0
References: <CAPybu_2=rY5g0MNNoztBZQQhbteXxgG7RdrgQAWT6HkaKvp8sA@mail.gmail.com>
 <20180918061952.14335-1-ricardo.ribalda@gmail.com> <20180930233513.GA16410@animalcreek.com>
 <CAPybu_297JGrQ1WtG7D277MnhVMboYHSTV_KBNCsjA6uJab4RA@mail.gmail.com>
 <20191108040813.GA19844@animalcreek.com> <20191108090501.GA278603@caravaggio> <20191109203830.GA31348@animalcreek.com>
In-Reply-To: <20191109203830.GA31348@animalcreek.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Sun, 10 Nov 2019 17:37:29 +0100
Message-ID: <CAPybu_2+p6vzPnmD05jBksRdAH8sYwPYeojU_FrmCOmY_dN=kg@mail.gmail.com>
To: Mark Greer <mgreer@animalcreek.com>
Message-ID-Hash: ORLYDYAQETSR5JLRHSXFW2OHL7MDABNX
X-Message-ID-Hash: ORLYDYAQETSR5JLRHSXFW2OHL7MDABNX
X-MailFrom: ricardo.ribalda@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2] ndef: Only register interface for known records
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/ORLYDYAQETSR5JLRHSXFW2OHL7MDABNX/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Unfortunately I cannot contribute much. I am not using neard everyday,
it is not my area of expertise and I just got a baby #2, so not much
time left for hacking :).

On Sat, Nov 9, 2019 at 9:38 PM Mark Greer <mgreer@animalcreek.com> wrote:
>
> On Fri, Nov 08, 2019 at 10:05:01AM +0100, Samuel Ortiz wrote:
> > Hi Mark, Ricardo,
> >
> > On Thu, Nov 07, 2019 at 09:08:13PM -0700, Mark Greer wrote:
> > > On Wed, Nov 06, 2019 at 03:13:26PM +0100, Ricardo Ribalda Delgado wrote:
> > > > Hi
> > > >
> > > > This is just my yearly ping to check if it has been merged ;)
> > > >
> > > > Best regards
> > > >
> > > > On Mon, Oct 1, 2018 at 1:35 AM Mark Greer <mgreer@animalcreek.com> wrote:
> > > > >
> > > > > On Tue, Sep 18, 2018 at 08:19:52AM +0200, Ricardo Ribalda Delgado wrote:
> > > > > > If we register the interface for unknown/error records neard daemon will
> > > > > > crash with no useful output message.
> > > > > > https://lists.01.org/pipermail/linux-nfc/2018-September/004445.html
> > > > > >
> > > > > > ...
> > > > > > neard[2404]: src/ndef.c:aar_exists() No AAR
> > > > > > neard[2404]: src/ndef.c:mime_payload_exists() No MIME payload
> > > > > > neard[2404]: D-Bus disconnect
> > > > > > neard[2404]: D-Bus disconnect (BT)
> > > > > > ...
> > > > > >
> > > > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > > > > > ---
> > > > >
> > > > > FWIW,
> > > > >
> > > > > Reviewed-by: Mark Greer <mgreer@animalcreek.com>
> > >
> > > Hi Ricardo.
> > >
> > > I don't think anyone is maintaining neard nowadays.  :(
> >
> > I would say that's correct. I moved on to different areas and don't have
> > time to maintain it anymore. I also released my kernel NFC maintainer
> > role. Sorry about that.
> >
> > > I don't really have any suggestions for you on how to proceed.
> > >
> > > Samuel, any thoughts?
> >
> > What about moving the neard repo to github and have you or Ricardo (or
> > both) maintain it from there?
>
> I'm okay with that but I am really busy these days.  I'll do what I
> can but I know I won't be very prompt.  Ricardo, can you help me with
> that?
>
> Mark
> --



-- 
Ricardo Ribalda
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
