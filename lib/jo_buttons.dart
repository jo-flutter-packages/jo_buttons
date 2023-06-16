library jo_buttons;

import 'package:flutter/material.dart';

class JOSmallButton extends StatefulWidget {
  const JOSmallButton({
    Key? key,
    required this.onClick,
    this.route,
    required this.icon,
    this.title,
    required this.visible,
    required this.enabled,
  }) : super(key: key);
  final Function() onClick;
  final String? route;
  final IconData icon;
  final String? title;
  final bool visible;
  final bool enabled;
  @override
  State<JOSmallButton> createState() => _JOSmallButtonState();
}

class _JOSmallButtonState extends State<JOSmallButton> {
  bool inProgress = false;
  @override
  Widget build(BuildContext context) {
    return widget.visible
        ? InkWell(
            onTap: () {
              widget.onClick.call();
            },
            child: Container(
              width: 100.0,
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: widget.enabled
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: widget.enabled
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        inProgress
                            ? CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.background,
                              )
                            : Icon(
                                widget.icon,
                                size: 25.0,
                                color: Theme.of(context).splashColor,
                              ),
                        widget.title != null
                            ? SizedBox(
                                width: 10.0,
                              )
                            : SizedBox(),
                        widget.title != null
                            ? Text(
                                widget.title ?? "",
                                style: TextStyle(
                                  color: Theme.of(context).backgroundColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : SizedBox(),
                      ],
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.disabled_visible,
                          size: 25.0,
                          color: Theme.of(context).backgroundColor,
                        ),
                        Text(
                          "",
                          style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
            ),
          )
        : Container();
  }
}

class JOFloatingButton extends StatefulWidget {
  const JOFloatingButton({
    Key? key,
    required this.icon,
    required this.actionCallback,
    required this.visible,
  }) : super(key: key);
  final Icon icon;
  final Function() actionCallback;

  final bool visible;
  @override
  State<JOFloatingButton> createState() => _JOFloatingButtonState();
}

class _JOFloatingButtonState extends State<JOFloatingButton> {
  bool inProgress = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: CircleAvatar(
          child: inProgress
              ? CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.background,
                )
              : widget.icon,
        ),
        onTap: () {
          widget.actionCallback.call();
        });
  }
}
