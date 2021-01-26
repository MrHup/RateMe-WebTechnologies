import 'package:flutter/material.dart';
import 'package:rate_me/static/theme_data.dart';

extension CustomExtension on Widget {
  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget scaleEvenly(double scale) {
    return Transform.scale(
      scale: scale,
      child: this,
    );
  }

  Widget padded(final double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  Widget paddedSides(final double padding) {
    return Padding(
        padding: EdgeInsets.fromLTRB(padding, 0, padding, 0), child: this);
  }

  Widget paddedTop(final double padding) {
    return Padding(padding: EdgeInsets.fromLTRB(0, padding, 0, 0), child: this);
  }

  Widget paddedBottom(final double padding) {
    return Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, padding), child: this);
  }

  Widget withGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.65],
          colors: [
            CustomTheme.gradientLight,
            CustomTheme.gradientDark,
          ],
        ),
      ),
      child: this,
    );
  }

  Widget withExpanded(int flex) {
    return Expanded(
      child: this,
      flex: flex,
    );
  }

  Widget paddedLeft(final double padding) {
    return (Padding(
        padding: EdgeInsets.fromLTRB(padding, 0, 0, 0), child: this));
  }

  Widget paddedRight(final double padding) {
    return (Padding(
        padding: EdgeInsets.fromLTRB(0, 0, padding, 0), child: this));
  }

  Widget withBackground(final Color col) {
    return Container(
      child: this,
      color: col,
    );
  }

  Widget alignStart() {
    return Align(
      alignment: Alignment.centerLeft,
      child: this,
    );
  }
}
