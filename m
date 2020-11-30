Return-Path: <linux-nfc-bounces@lists.01.org>
X-Original-To: lists+linux-nfc@lfdr.de
Delivered-To: lists+linux-nfc@lfdr.de
Received: from ml01.01.org (ml01.01.org [198.145.21.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC0D2C8D33
	for <lists+linux-nfc@lfdr.de>; Mon, 30 Nov 2020 19:46:03 +0100 (CET)
Received: from ml01.vlan13.01.org (localhost [IPv6:::1])
	by ml01.01.org (Postfix) with ESMTP id 78129100EF26D;
	Mon, 30 Nov 2020 10:46:01 -0800 (PST)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.65; helo=mail-wr1-f65.google.com; envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN> 
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by ml01.01.org (Postfix) with ESMTPS id 686A2100EF267
	for <linux-nfc@lists.01.org>; Mon, 30 Nov 2020 10:45:59 -0800 (PST)
Received: by mail-wr1-f65.google.com with SMTP id i2so17580526wrs.4
        for <linux-nfc@lists.01.org>; Mon, 30 Nov 2020 10:45:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H/5Cxv9Uq9+a7wv/pYuBaWRyHKMoFbvJnzR3b306yYc=;
        b=kaGhnOiJfJvNoaPqtFM6e3VxQ9UVzz99iBO6dP/sxN+M7mGZsbbLucpeU8LLF1YaD6
         IdJUvv5dN/loPDcO5S7oRGiewTDP9/Rpj5uCBx2nj12Pm16C/EmbNUnL70n9E+PHreOe
         NN+Vs84fhead+0B7dJXkhIu20Lcj/tDaNi7HoSXRG3MbPzHwwnBEkqsMwfbXMvcuhndX
         Then+0W9r60QNx93T0ETUTDdlY93BSpqqB+M71lfw4G1OW2Fww6No0pVPLM+m8JsdJSR
         nInMFZAuvqaT/D67lguo6OWHmqXfPm0TXCBhj9QxkVpbrnNubheqXzwLGk736nBrsJFb
         XCQg==
X-Gm-Message-State: AOAM532K0AwPz0qqSFemdjdOACr3gFZI8YiObdd6l+IRVa6oeM5JOBUb
	ppc/uOH6K25DHCGszP+PIfM=
X-Google-Smtp-Source: ABdhPJy9ieylV0UDkF4mHZL2uf2Qxp8fYAgmovrk4tf7DbOWA1EaPYvv/an9xrKzPiQkbZAt0/z0YA==
X-Received: by 2002:a5d:4ccf:: with SMTP id c15mr29390224wrt.237.1606761957660;
        Mon, 30 Nov 2020 10:45:57 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id b18sm29975686wrt.54.2020.11.30.10.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 10:45:56 -0800 (PST)
Date: Mon, 30 Nov 2020 20:45:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bongsu Jeon <bongsu.jeon2@gmail.com>
Message-ID: <20201130184555.GD28735@kozik-lap>
References: <1606737945-29634-1-git-send-email-bongsu.jeon@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606737945-29634-1-git-send-email-bongsu.jeon@samsung.com>
Message-ID-Hash: M5YPHQK4PGND5I2ALXD7JEHSTCHBRJDG
X-Message-ID-Hash: M5YPHQK4PGND5I2ALXD7JEHSTCHBRJDG
X-MailFrom: k.kozlowski.k@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; suspicious-header
CC: linux-nfc@lists.01.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Bongsu Jeon <bongsu.jeon@samsung.com>
X-Mailman-Version: 3.1.1
Precedence: list
Subject: [linux-nfc] Re: [PATCH v2 net-next 4/4] net: nfc: s3fwrn5: Support a UART interface
List-Id: NFC on Linux <linux-nfc.lists.01.org>
Archived-At: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/message/M5YPHQK4PGND5I2ALXD7JEHSTCHBRJDG/>
List-Archive: <https://lists.01.org/hyperkitty/list/linux-nfc@lists.01.org/>
List-Help: <mailto:linux-nfc-request@lists.01.org?subject=help>
List-Post: <mailto:linux-nfc@lists.01.org>
List-Subscribe: <mailto:linux-nfc-join@lists.01.org>
List-Unsubscribe: <mailto:linux-nfc-leave@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 30, 2020 at 09:05:45PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> 
> Since S3FWRN82 NFC Chip, The UART interface can be used.
> S3FWRN82 uses NCI protocol and supports I2C and UART interface.
> 
> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
> 
>  Changes in v2:
>    - remove the kfree(phy) because of duplicated free.
>    - use the phy_common blocks.
>    - wrap lines properly.
> 
>  drivers/nfc/s3fwrn5/Kconfig      |  12 +++
>  drivers/nfc/s3fwrn5/Makefile     |   2 +
>  drivers/nfc/s3fwrn5/phy_common.c |  12 +++
>  drivers/nfc/s3fwrn5/phy_common.h |   1 +
>  drivers/nfc/s3fwrn5/uart.c       | 197 +++++++++++++++++++++++++++++++++++++++
>  5 files changed, 224 insertions(+)
>  create mode 100644 drivers/nfc/s3fwrn5/uart.c
> 
> diff --git a/drivers/nfc/s3fwrn5/Kconfig b/drivers/nfc/s3fwrn5/Kconfig
> index 3f8b6da..8a6b1a7 100644
> --- a/drivers/nfc/s3fwrn5/Kconfig
> +++ b/drivers/nfc/s3fwrn5/Kconfig
> @@ -20,3 +20,15 @@ config NFC_S3FWRN5_I2C
>  	  To compile this driver as a module, choose m here. The module will
>  	  be called s3fwrn5_i2c.ko.
>  	  Say N if unsure.
> +
> +config NFC_S3FWRN82_UART
> +        tristate "Samsung S3FWRN82 UART support"
> +        depends on NFC_NCI && SERIAL_DEV_BUS
> +        select NFC_S3FWRN5
> +        help
> +          This module adds support for a UART interface to the S3FWRN82 chip.
> +          Select this if your platform is using the UART bus.
> +
> +          To compile this driver as a module, choose m here. The module will
> +          be called s3fwrn82_uart.ko.
> +          Say N if unsure.
> diff --git a/drivers/nfc/s3fwrn5/Makefile b/drivers/nfc/s3fwrn5/Makefile
> index 6b6f52d..7da827a 100644
> --- a/drivers/nfc/s3fwrn5/Makefile
> +++ b/drivers/nfc/s3fwrn5/Makefile
> @@ -5,6 +5,8 @@
>  
>  s3fwrn5-objs = core.o firmware.o nci.o phy_common.o
>  s3fwrn5_i2c-objs = i2c.o
> +s3fwrn82_uart-objs = uart.o
>  
>  obj-$(CONFIG_NFC_S3FWRN5) += s3fwrn5.o
>  obj-$(CONFIG_NFC_S3FWRN5_I2C) += s3fwrn5_i2c.o
> +obj-$(CONFIG_NFC_S3FWRN82_UART) += s3fwrn82_uart.o
> diff --git a/drivers/nfc/s3fwrn5/phy_common.c b/drivers/nfc/s3fwrn5/phy_common.c
> index 5cad1f4..497b02b 100644
> --- a/drivers/nfc/s3fwrn5/phy_common.c
> +++ b/drivers/nfc/s3fwrn5/phy_common.c
> @@ -47,6 +47,18 @@ bool s3fwrn5_phy_power_ctrl(struct phy_common *phy, enum s3fwrn5_mode mode)
>  }
>  EXPORT_SYMBOL(s3fwrn5_phy_power_ctrl);
>  
> +void s3fwrn5_phy_set_mode(void *phy_id, enum s3fwrn5_mode mode)
> +{
> +	struct phy_common *phy = phy_id;
> +
> +	mutex_lock(&phy->mutex);
> +
> +	s3fwrn5_phy_power_ctrl(phy, mode);
> +
> +	mutex_unlock(&phy->mutex);
> +}
> +EXPORT_SYMBOL(s3fwrn5_phy_set_mode);
> +
>  enum s3fwrn5_mode s3fwrn5_phy_get_mode(void *phy_id)
>  {
>  	struct phy_common *phy = phy_id;
> diff --git a/drivers/nfc/s3fwrn5/phy_common.h b/drivers/nfc/s3fwrn5/phy_common.h
> index b98531d..99749c9 100644
> --- a/drivers/nfc/s3fwrn5/phy_common.h
> +++ b/drivers/nfc/s3fwrn5/phy_common.h
> @@ -31,6 +31,7 @@ struct phy_common {
>  
>  void s3fwrn5_phy_set_wake(void *phy_id, bool wake);
>  bool s3fwrn5_phy_power_ctrl(struct phy_common *phy, enum s3fwrn5_mode mode);
> +void s3fwrn5_phy_set_mode(void *phy_id, enum s3fwrn5_mode mode);
>  enum s3fwrn5_mode s3fwrn5_phy_get_mode(void *phy_id);
>  
>  #endif /* __NFC_S3FWRN5_PHY_COMMON_H */
> diff --git a/drivers/nfc/s3fwrn5/uart.c b/drivers/nfc/s3fwrn5/uart.c
> new file mode 100644
> index 0000000..f5ac017
> --- /dev/null
> +++ b/drivers/nfc/s3fwrn5/uart.c
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * UART Link Layer for S3FWRN82 NCI based Driver
> + *
> + * Copyright (C) 2015 Samsung Electronics
> + * Robert Baldyga <r.baldyga@samsung.com>
> + * Copyright (C) 2020 Samsung Electronics
> + * Bongsu Jeon <bongsu.jeon@samsung.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/nfc.h>
> +#include <linux/netdevice.h>
> +#include <linux/of.h>
> +#include <linux/serdev.h>
> +#include <linux/gpio.h>
> +#include <linux/of_gpio.h>
> +
> +#include "phy_common.h"
> +
> +#define S3FWRN82_NCI_HEADER 3
> +#define S3FWRN82_NCI_IDX 2
> +#define NCI_SKB_BUFF_LEN 258
> +
> +struct s3fwrn82_uart_phy {
> +	struct phy_common common;
> +	struct serdev_device *ser_dev;
> +	struct sk_buff *recv_skb;
> +};
> +
> +static int s3fwrn82_uart_write(void *phy_id, struct sk_buff *out)
> +{
> +	struct s3fwrn82_uart_phy *phy = phy_id;
> +	int err;
> +
> +	err = serdev_device_write(phy->ser_dev,
> +				  out->data, out->len,
> +				  MAX_SCHEDULE_TIMEOUT);
> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static const struct s3fwrn5_phy_ops uart_phy_ops = {
> +	.set_wake = s3fwrn5_phy_set_wake,
> +	.set_mode = s3fwrn5_phy_set_mode,
> +	.get_mode = s3fwrn5_phy_get_mode,
> +	.write = s3fwrn82_uart_write,
> +};
> +
> +static int s3fwrn82_uart_read(struct serdev_device *serdev,
> +			      const unsigned char *data,
> +			      size_t count)
> +{
> +	struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
> +	size_t i;
> +
> +	for (i = 0; i < count; i++) {
> +		skb_put_u8(phy->recv_skb, *data++);
> +
> +		if (phy->recv_skb->len < S3FWRN82_NCI_HEADER)
> +			continue;
> +
> +		if ((phy->recv_skb->len - S3FWRN82_NCI_HEADER)
> +				< phy->recv_skb->data[S3FWRN82_NCI_IDX])
> +			continue;
> +
> +		s3fwrn5_recv_frame(phy->common.ndev, phy->recv_skb,
> +				   phy->common.mode);
> +		phy->recv_skb = alloc_skb(NCI_SKB_BUFF_LEN, GFP_KERNEL);
> +		if (!phy->recv_skb)
> +			return 0;
> +	}
> +
> +	return i;
> +}
> +
> +static const struct serdev_device_ops s3fwrn82_serdev_ops = {
> +	.receive_buf = s3fwrn82_uart_read,
> +	.write_wakeup = serdev_device_write_wakeup,
> +};
> +
> +static const struct of_device_id s3fwrn82_uart_of_match[] = {
> +	{ .compatible = "samsung,s3fwrn82", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, s3fwrn82_uart_of_match);
> +
> +static int s3fwrn82_uart_parse_dt(struct serdev_device *serdev)
> +{
> +	struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
> +	struct device_node *np = serdev->dev.of_node;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	phy->common.gpio_en = of_get_named_gpio(np, "en-gpios", 0);
> +	if (!gpio_is_valid(phy->common.gpio_en))
> +		return -ENODEV;
> +
> +	phy->common.gpio_fw_wake = of_get_named_gpio(np, "wake-gpios", 0);
> +	if (!gpio_is_valid(phy->common.gpio_fw_wake))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int s3fwrn82_uart_probe(struct serdev_device *serdev)
> +{
> +	struct s3fwrn82_uart_phy *phy;
> +	int ret = -ENOMEM;
> +
> +	phy = devm_kzalloc(&serdev->dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		goto err_exit;
> +
> +	phy->recv_skb = alloc_skb(NCI_SKB_BUFF_LEN, GFP_KERNEL);
> +	if (!phy->recv_skb)
> +		goto err_free;
> +
> +	mutex_init(&phy->common.mutex);
> +	phy->common.mode = S3FWRN5_MODE_COLD;
> +
> +	phy->ser_dev = serdev;
> +	serdev_device_set_drvdata(serdev, phy);
> +	serdev_device_set_client_ops(serdev, &s3fwrn82_serdev_ops);
> +	ret = serdev_device_open(serdev);
> +	if (ret) {
> +		dev_err(&serdev->dev, "Unable to open device\n");
> +		goto err_skb;
> +	}
> +
> +	ret = serdev_device_set_baudrate(serdev, 115200);
> +	if (ret != 115200) {
> +		ret = -EINVAL;
> +		goto err_serdev;
> +	}
> +
> +	serdev_device_set_flow_control(serdev, false);
> +
> +	ret = s3fwrn82_uart_parse_dt(serdev);
> +	if (ret < 0)
> +		goto err_serdev;
> +
> +	ret = devm_gpio_request_one(&phy->ser_dev->dev, phy->common.gpio_en,
> +				    GPIOF_OUT_INIT_HIGH, "s3fwrn82_en");
> +	if (ret < 0)
> +		goto err_serdev;
> +
> +	ret = devm_gpio_request_one(&phy->ser_dev->dev,
> +				    phy->common.gpio_fw_wake,
> +				    GPIOF_OUT_INIT_LOW, "s3fwrn82_fw_wake");
> +	if (ret < 0)
> +		goto err_serdev;
> +
> +	ret = s3fwrn5_probe(&phy->common.ndev, phy, &phy->ser_dev->dev,
> +			    &uart_phy_ops);
> +	if (ret < 0)
> +		goto err_serdev;
> +
> +	return ret;
> +
> +err_serdev:
> +	serdev_device_close(serdev);
> +err_skb:
> +	kfree_skb(phy->recv_skb);
> +err_free:
> +err_exit:
> +	return ret;
> +}
> +
> +static void s3fwrn82_uart_remove(struct serdev_device *serdev)
> +{
> +	struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
> +
> +	s3fwrn5_remove(phy->common.ndev);
> +	serdev_device_close(serdev);
> +	kfree_skb(phy->recv_skb);
> +}
> +
> +static struct serdev_device_driver s3fwrn82_uart_driver = {
> +	.probe = s3fwrn82_uart_probe,
> +	.remove = s3fwrn82_uart_remove,
> +	.driver = {
> +		.name = "s3fwrn82_uart",
> +		.of_match_table = of_match_ptr(s3fwrn82_uart_of_match),

Compile with W=1. Fix the warnings - preferably by removing
of_match_ptr().

Best regards,
Krzysztof
_______________________________________________
Linux-nfc mailing list -- linux-nfc@lists.01.org
To unsubscribe send an email to linux-nfc-leave@lists.01.org
%(web_page_url)slistinfo%(cgiext)s/%(_internal_name)s
