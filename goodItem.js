.pragma library

var minWidth = 250

function getImageCardWidth(width)
{
    return Math.floor(minWidth + (width - (Math.floor(width / minWidth) * minWidth)) / Math.floor(width / minWidth));
}

function getImageCardHeight(height)
{
    return getImageCardWidth(height)
}
