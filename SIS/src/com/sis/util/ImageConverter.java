/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sis.util;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.swing.ImageIcon;

/**
 * 
 * @author  :Jayanta Pal
 * @Project :EDUSPHERE
 * @version :1.0
 * @Company :www.cloudlabz.com
 * @date    :11-Aug-2010
 */
public class ImageConverter {

    public byte[] resizeImageAsJPG(byte[] pImageData, int pMaxWidth, int pMaxHeight) throws IOException {
        ImageIcon imageIcon = new ImageIcon(pImageData);

        // Create a new empty image buffer to "draw" the resized image into
        BufferedImage bufferedResizedImage = new BufferedImage(pMaxWidth, pMaxHeight, BufferedImage.TYPE_INT_RGB);

        // Create a Graphics object to do the "drawing"
        Graphics2D g2d = bufferedResizedImage.createGraphics();
        g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
        g2d.drawImage(imageIcon.getImage(), 0, 0, pMaxWidth, pMaxHeight, null);

        g2d.setColor(Color.white);
        g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);

        g2d.setFont(new Font("Arial", Font.ITALIC, 12));
        String watermark = "csslabz © 2010";
        FontMetrics fontMetrics = g2d.getFontMetrics();
        Rectangle2D rect = fontMetrics.getStringBounds(watermark, g2d);

        int centerX =10;//(imageIcon.getIconWidth() - (int) rect.getWidth()) / 2;
        int centerY =295;//(imageIcon.getIconHeight() - (int) rect.getHeight()) / 2;
        g2d.drawString(watermark, centerX, centerY);

        // Draw the resized image
        g2d.dispose();

        // Now our buffered image is ready
        // Encode it as a JPEG
        ByteArrayOutputStream encoderOutputStream = new ByteArrayOutputStream();
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(encoderOutputStream);
        encoder.encode(bufferedResizedImage);

        byte[] resizedImageByteArray = encoderOutputStream.toByteArray();

        return resizedImageByteArray;
    }
}
