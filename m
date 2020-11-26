Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [IPv6:2001:19d0:306:5::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 702B32C5E0E
	for <lists+linux-nfc@lfdr.de>; Fri, 27 Nov 2020 00:09:43 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id C2831100EC1F4;
	Thu, 26 Nov 2020 15:09:41 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com; envelope-from=bongsu.jeon2@gmail.com; receiver=<UNKNOWN> 
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id D30B0100EC1F3
	for <linux-nfc@lists.01.org>; Thu, 26 Nov 2020 15:09:37 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id q13so3878930lfr.10
        for <linux-nfc@lists.01.org>; Thu, 26 Nov 2020 15:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o2mGHplmmAYgu4+m85HWNb0dm8EPlCtusI2/J/afj9M=;
        b=Z2+ZHzwlnYMIj/9jfHI2OFBvb1ankSLHvbvGimN7W/pm1NC+2DQw7hI6iUiaYXkoJK
         Tdo0SSqepShji4aKsRKE4WJCrGUX8EFl8JhjjUsogLgYFSblmeCph8F5oPmGZjUKN1+2
         1BubgF5pB33y3v6Y3qBbZz8qALbU5mae4+DYT98kkFjVfpl4vxsXkTf1X50rRH6kpFjz
         yqShtp2YQDYdx08tjGw9V+0QMIuwridhicjDaDVOAdNxpaDPD9NLuLR1/RAA0Q89G6jh
         AA0aqgXi+GRsp5+upQB2i9lE6OuXoOYoLmY7xXzPYj6xpoA4KqBCO2AkNddm2TXbBlUL
         fidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2mGHplmmAYgu4+m85HWNb0dm8EPlCtusI2/J/afj9M=;
        b=g83cyOUr6PgXsKMDG4bOkrdXYENLtSDw5xa7GT8JbyRpxxhpINMcHVtTISeHoDT+so
         7sEX19u7HTXmz5RLHgRN7z2oDc6ZKr6YwAFkgnZB85DDTXNT7lXYv4LBoeqVK5Mafj6C
         p25haUCa13grwg/TcSxNi1wiAEpjyLjcFzh/UCPfjB1uu+c5UvP2XJUsQ7+PS+N4Vtyf
         IGBnnOBn4CP6SFXuzfzdY/DPSgvKm+rjNkyF8SM7+eOLs5+c9Cilz8gbCvADzvjvUxQW
         ZdJdBoD585RrX4bWHauCq3Gk847xSbT7Cl82/ZuFs+ipg4LJ6bELXlg1qryQ5YboVLNR
         9u8g==
X-Gm-Message-State: AOAM531wPsHZevt6fZy2Fi6Pt86HvQpq4tFsj3jy9D1Q+HV6G/XQpYQO
	/4jPPi4bYoN+T63/4JCjIJJjxFjLhH+K3N4AeLQ=
X-Google-Smtp-Source: ABdhPJx02yrzqNWFAZS4TwCilz22NLhditcsL0YFsMpEboF1vWo7kNrTwtCkP9CP+pumQkvsE2tYDHW6XzwUQhCLIEw=
X-Received: by 2002:a19:5e5e:: with SMTP id z30mr2093841lfi.277.1606432175651;
 Thu, 26 Nov 2020 15:09:35 -0800 (PST)
MIME-Version: 1.0
References: <1606404819-30647-1-git-send-email-bongsu.jeon@samsung.com>
 <1606404819-30647-3-git-send-email-bongsu.jeon@samsung.com> <20201126171257.GC4978@kozik-lap>
In-Reply-To: <20201126171257.GC4978@kozik-lap>
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
Date: Fri, 27 Nov 2020 08:09:24 +0900
Message-ID: <CACwDmQAi+DfjWSzrWQd+EFDy+6Jk8VVCigpCcCC=OBg0m-PbXg@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID-Hash: D6MPJHTD3X7DG274MBCVD7BPWKHDSOF2
X-Message-ID-Hash: D6MPJHTD3X7DG274MBCVD7BPWKHDSOF2
X-MailFrom: bongsu.jeon2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH net-next 3/3] nfc: s3fwrn5: extract the common phy blocks
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/D6MPJHTD3X7DG274MBCVD7BPWKHDSOF2/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 27, 2020 at 2:13 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Nov 27, 2020 at 12:33:39AM +0900, bongsu.jeon2@gmail.com wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > Extract the common phy blocks to reuse it.
> > The UART module will use the common blocks.
>
>
> Hi,
>
> Thanks for the patch. Few comments below.
>
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> > ---
> >  drivers/nfc/s3fwrn5/i2c.c        | 111 ++++++++++++---------------------------
> >  drivers/nfc/s3fwrn5/phy_common.h |  86 ++++++++++++++++++++++++++++++
> >  2 files changed, 119 insertions(+), 78 deletions(-)
> >  create mode 100644 drivers/nfc/s3fwrn5/phy_common.h
> >
> > diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> > index 9a64eea..cd1b2a7 100644
> > --- a/drivers/nfc/s3fwrn5/i2c.c
> > +++ b/drivers/nfc/s3fwrn5/i2c.c
> > @@ -15,75 +15,30 @@
> >
> >  #include <net/nfc/nfc.h>
> >
> > -#include "s3fwrn5.h"
> > +#include "phy_common.h"
> >
> >  #define S3FWRN5_I2C_DRIVER_NAME "s3fwrn5_i2c"
> >
> > -#define S3FWRN5_EN_WAIT_TIME 20
> > -
> >  struct s3fwrn5_i2c_phy {
> > +     struct phy_common common;
> >       struct i2c_client *i2c_dev;
> > -     struct nci_dev *ndev;
> > -
> > -     int gpio_en;
> > -     int gpio_fw_wake;
> > -
> > -     struct mutex mutex;
> >
> > -     enum s3fwrn5_mode mode;
> >       unsigned int irq_skip:1;
> >  };
> >
> > -static void s3fwrn5_i2c_set_wake(void *phy_id, bool wake)
> > -{
> > -     struct s3fwrn5_i2c_phy *phy = phy_id;
> > -
> > -     mutex_lock(&phy->mutex);
> > -     gpio_set_value(phy->gpio_fw_wake, wake);
> > -     msleep(S3FWRN5_EN_WAIT_TIME);
> > -     mutex_unlock(&phy->mutex);
> > -}
> > -
> >  static void s3fwrn5_i2c_set_mode(void *phy_id, enum s3fwrn5_mode mode)
> >  {
> >       struct s3fwrn5_i2c_phy *phy = phy_id;
> >
> > -     mutex_lock(&phy->mutex);
> > +     mutex_lock(&phy->common.mutex);
> >
> > -     if (phy->mode == mode)
> > +     if (s3fwrn5_phy_power_ctrl(&phy->common, mode) == false)
> >               goto out;
> >
> > -     phy->mode = mode;
> > -
> > -     gpio_set_value(phy->gpio_en, 1);
> > -     gpio_set_value(phy->gpio_fw_wake, 0);
> > -     if (mode == S3FWRN5_MODE_FW)
> > -             gpio_set_value(phy->gpio_fw_wake, 1);
> > -
> > -     if (mode != S3FWRN5_MODE_COLD) {
> > -             msleep(S3FWRN5_EN_WAIT_TIME);
> > -             gpio_set_value(phy->gpio_en, 0);
> > -             msleep(S3FWRN5_EN_WAIT_TIME);
> > -     }
> > -
> >       phy->irq_skip = true;
> >
> >  out:
> > -     mutex_unlock(&phy->mutex);
> > -}
> > -
> > -static enum s3fwrn5_mode s3fwrn5_i2c_get_mode(void *phy_id)
> > -{
> > -     struct s3fwrn5_i2c_phy *phy = phy_id;
> > -     enum s3fwrn5_mode mode;
> > -
> > -     mutex_lock(&phy->mutex);
> > -
> > -     mode = phy->mode;
> > -
> > -     mutex_unlock(&phy->mutex);
> > -
> > -     return mode;
> > +     mutex_unlock(&phy->common.mutex);
> >  }
> >
> >  static int s3fwrn5_i2c_write(void *phy_id, struct sk_buff *skb)
> > @@ -91,7 +46,7 @@ static int s3fwrn5_i2c_write(void *phy_id, struct sk_buff *skb)
> >       struct s3fwrn5_i2c_phy *phy = phy_id;
> >       int ret;
> >
> > -     mutex_lock(&phy->mutex);
> > +     mutex_lock(&phy->common.mutex);
> >
> >       phy->irq_skip = false;
> >
> > @@ -102,7 +57,7 @@ static int s3fwrn5_i2c_write(void *phy_id, struct sk_buff *skb)
> >               ret  = i2c_master_send(phy->i2c_dev, skb->data, skb->len);
> >       }
> >
> > -     mutex_unlock(&phy->mutex);
> > +     mutex_unlock(&phy->common.mutex);
> >
> >       if (ret < 0)
> >               return ret;
> > @@ -114,9 +69,9 @@ static int s3fwrn5_i2c_write(void *phy_id, struct sk_buff *skb)
> >  }
> >
> >  static const struct s3fwrn5_phy_ops i2c_phy_ops = {
> > -     .set_wake = s3fwrn5_i2c_set_wake,
> > +     .set_wake = s3fwrn5_phy_set_wake,
> >       .set_mode = s3fwrn5_i2c_set_mode,
> > -     .get_mode = s3fwrn5_i2c_get_mode,
> > +     .get_mode = s3fwrn5_phy_get_mode,
> >       .write = s3fwrn5_i2c_write,
> >  };
> >
> > @@ -128,7 +83,7 @@ static int s3fwrn5_i2c_read(struct s3fwrn5_i2c_phy *phy)
> >       char hdr[4];
> >       int ret;
> >
> > -     hdr_size = (phy->mode == S3FWRN5_MODE_NCI) ?
> > +     hdr_size = (phy->common.mode == S3FWRN5_MODE_NCI) ?
> >               NCI_CTRL_HDR_SIZE : S3FWRN5_FW_HDR_SIZE;
> >       ret = i2c_master_recv(phy->i2c_dev, hdr, hdr_size);
> >       if (ret < 0)
> > @@ -137,7 +92,7 @@ static int s3fwrn5_i2c_read(struct s3fwrn5_i2c_phy *phy)
> >       if (ret < hdr_size)
> >               return -EBADMSG;
> >
> > -     data_len = (phy->mode == S3FWRN5_MODE_NCI) ?
> > +     data_len = (phy->common.mode == S3FWRN5_MODE_NCI) ?
> >               ((struct nci_ctrl_hdr *)hdr)->plen :
> >               ((struct s3fwrn5_fw_header *)hdr)->len;
> >
> > @@ -157,24 +112,24 @@ static int s3fwrn5_i2c_read(struct s3fwrn5_i2c_phy *phy)
> >       }
> >
> >  out:
> > -     return s3fwrn5_recv_frame(phy->ndev, skb, phy->mode);
> > +     return s3fwrn5_recv_frame(phy->common.ndev, skb, phy->common.mode);
> >  }
> >
> >  static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, void *phy_id)
> >  {
> >       struct s3fwrn5_i2c_phy *phy = phy_id;
> >
> > -     if (!phy || !phy->ndev) {
> > +     if (!phy || !phy->common.ndev) {
> >               WARN_ON_ONCE(1);
> >               return IRQ_NONE;
> >       }
> >
> > -     mutex_lock(&phy->mutex);
> > +     mutex_lock(&phy->common.mutex);
> >
> >       if (phy->irq_skip)
> >               goto out;
> >
> > -     switch (phy->mode) {
> > +     switch (phy->common.mode) {
> >       case S3FWRN5_MODE_NCI:
> >       case S3FWRN5_MODE_FW:
> >               s3fwrn5_i2c_read(phy);
> > @@ -184,7 +139,7 @@ static irqreturn_t s3fwrn5_i2c_irq_thread_fn(int irq, void *phy_id)
> >       }
> >
> >  out:
> > -     mutex_unlock(&phy->mutex);
> > +     mutex_unlock(&phy->common.mutex);
> >
> >       return IRQ_HANDLED;
> >  }
> > @@ -197,19 +152,19 @@ static int s3fwrn5_i2c_parse_dt(struct i2c_client *client)
> >       if (!np)
> >               return -ENODEV;
> >
> > -     phy->gpio_en = of_get_named_gpio(np, "en-gpios", 0);
> > -     if (!gpio_is_valid(phy->gpio_en)) {
> > +     phy->common.gpio_en = of_get_named_gpio(np, "en-gpios", 0);
> > +     if (!gpio_is_valid(phy->common.gpio_en)) {
> >               /* Support also deprecated property */
> > -             phy->gpio_en = of_get_named_gpio(np, "s3fwrn5,en-gpios", 0);
> > -             if (!gpio_is_valid(phy->gpio_en))
> > +             phy->common.gpio_en = of_get_named_gpio(np, "s3fwrn5,en-gpios", 0);
> > +             if (!gpio_is_valid(phy->common.gpio_en))
> >                       return -ENODEV;
> >       }
> >
> > -     phy->gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
> > -     if (!gpio_is_valid(phy->gpio_fw_wake)) {
> > +     phy->common.gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
> > +     if (!gpio_is_valid(phy->common.gpio_fw_wake)) {
> >               /* Support also deprecated property */
> > -             phy->gpio_fw_wake = of_get_named_gpio(np, "s3fwrn5,fw-gpios", 0);
> > -             if (!gpio_is_valid(phy->gpio_fw_wake))
> > +             phy->common.gpio_fw_wake = of_get_named_gpio(np, "s3fwrn5,fw-gpios", 0);
>
> The lines here should wrap at 80 character.
>
> > +             if (!gpio_is_valid(phy->common.gpio_fw_wake))
> >                       return -ENODEV;
> >       }
> >
> > @@ -226,8 +181,8 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
> >       if (!phy)
> >               return -ENOMEM;
> >
> > -     mutex_init(&phy->mutex);
> > -     phy->mode = S3FWRN5_MODE_COLD;
> > +     mutex_init(&phy->common.mutex);
> > +     phy->common.mode = S3FWRN5_MODE_COLD;
> >       phy->irq_skip = true;
> >
> >       phy->i2c_dev = client;
> > @@ -237,17 +192,17 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
> >       if (ret < 0)
> >               return ret;
> >
> > -     ret = devm_gpio_request_one(&phy->i2c_dev->dev, phy->gpio_en,
> > -             GPIOF_OUT_INIT_HIGH, "s3fwrn5_en");
> > +     ret = devm_gpio_request_one(&phy->i2c_dev->dev, phy->common.gpio_en,
> > +                                 GPIOF_OUT_INIT_HIGH, "s3fwrn5_en");
> >       if (ret < 0)
> >               return ret;
> >
> > -     ret = devm_gpio_request_one(&phy->i2c_dev->dev, phy->gpio_fw_wake,
> > -             GPIOF_OUT_INIT_LOW, "s3fwrn5_fw_wake");
> > +     ret = devm_gpio_request_one(&phy->i2c_dev->dev, phy->common.gpio_fw_wake,
> > +                                 GPIOF_OUT_INIT_LOW, "s3fwrn5_fw_wake");
> >       if (ret < 0)
> >               return ret;
> >
> > -     ret = s3fwrn5_probe(&phy->ndev, phy, &phy->i2c_dev->dev, &i2c_phy_ops);
> > +     ret = s3fwrn5_probe(&phy->common.ndev, phy, &phy->i2c_dev->dev, &i2c_phy_ops);
>
> Please wrap the lines.
>
> >       if (ret < 0)
> >               return ret;
> >
> > @@ -255,7 +210,7 @@ static int s3fwrn5_i2c_probe(struct i2c_client *client,
> >               s3fwrn5_i2c_irq_thread_fn, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> >               S3FWRN5_I2C_DRIVER_NAME, phy);
> >       if (ret)
> > -             s3fwrn5_remove(phy->ndev);
> > +             s3fwrn5_remove(phy->common.ndev);
> >
> >       return ret;
> >  }
> > @@ -264,7 +219,7 @@ static int s3fwrn5_i2c_remove(struct i2c_client *client)
> >  {
> >       struct s3fwrn5_i2c_phy *phy = i2c_get_clientdata(client);
> >
> > -     s3fwrn5_remove(phy->ndev);
> > +     s3fwrn5_remove(phy->common.ndev);
> >
> >       return 0;
> >  }
> > diff --git a/drivers/nfc/s3fwrn5/phy_common.h b/drivers/nfc/s3fwrn5/phy_common.h
> > new file mode 100644
> > index 0000000..14f7690
> > --- /dev/null
> > +++ b/drivers/nfc/s3fwrn5/phy_common.h
> > @@ -0,0 +1,86 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * Link Layer for Samsung S3FWRN5 NCI based Driver
> > + *
> > + * Copyright (C) 2015 Samsung Electrnoics
> > + * Robert Baldyga <r.baldyga@samsung.com>
> > + * Copyright (C) 2020 Samsung Electrnoics
> > + * Bongsu Jeon <bongsu.jeon@samsung.com>
> > + */
> > +
> > +#ifndef __LOCAL_PHY_COMMON_H
> > +#define __LOCAL_PHY_COMMON_H
>
> Header guard: __NFC_S3FWRN5_PHY_COMMON_H
>
> > +
> > +#include "s3fwrn5.h"
>
> This include should not be needed.
>

Actually, I included this because of enum s3fwrn5_mode.
Do you think the following structure is good?

0. remove the '#include "s3fwrn5.h" and the common function's
definition in phy_common.h.
1. make phy_common.c that includes the common function's definition
and "s3fwrn5.h , phy_common.h".
2. i2c.c includes "s3fwrn5.h , phy_common.h".

> > +
> > +#define S3FWRN5_EN_WAIT_TIME 20
> > +
> > +struct phy_common {
> > +     struct nci_dev *ndev;
> > +
> > +     int gpio_en;
> > +     int gpio_fw_wake;
> > +
> > +     struct mutex mutex;
> > +
> > +     enum s3fwrn5_mode mode;
> > +};
> > +
> > +static inline void s3fwrn5_phy_set_wake(void *phy_id, bool wake)
> > +{
>
> All these should go to a C source file. If needed - GPL exported.
>
> > +     struct phy_common *phy = phy_id;
> > +
> > +     mutex_lock(&phy->mutex);
> > +     gpio_set_value(phy->gpio_fw_wake, wake);
> > +     msleep(S3FWRN5_EN_WAIT_TIME);
> > +     mutex_unlock(&phy->mutex);
> > +}
> > +
> > +static inline bool s3fwrn5_phy_power_ctrl(struct phy_common *phy,
> > +                                       enum s3fwrn5_mode mode)
> > +{
> > +     if (phy->mode == mode)
> > +             return false;
> > +
> > +     phy->mode = mode;
> > +
> > +     gpio_set_value(phy->gpio_en, 1);
> > +     gpio_set_value(phy->gpio_fw_wake, 0);
> > +     if (mode == S3FWRN5_MODE_FW)
> > +             gpio_set_value(phy->gpio_fw_wake, 1);
> > +
> > +     if (mode != S3FWRN5_MODE_COLD) {
> > +             msleep(S3FWRN5_EN_WAIT_TIME);
> > +             gpio_set_value(phy->gpio_en, 0);
> > +             msleep(S3FWRN5_EN_WAIT_TIME);
> > +     }
> > +
> > +     return true;
> > +}
> > +
> > +static inline void s3fwrn5_phy_set_mode(void *phy_id, enum s3fwrn5_mode mode)
> > +{
>
> This looks unused. If you need it only for your next chip, add it with
> next patch (the patch adding the user).
>
Okay I understand it.

> Best regards,
> Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
