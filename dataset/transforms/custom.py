class BRGShuffle:
    def __init__(self, always_apply=False, p=1.0):
        self.always_apply = always_apply
        self.p = p

    def __call__(self, image):
        image = image[:, :, [2, 0, 1]]  # BRG
        return image

    def __repr__(self):
        return f'{self.__class__.__name__}(always_apply={self.always_apply}, p={self.p})'
    
class GBRShuffle:
    def __init__(self, always_apply=False, p=1.0):
        self.always_apply = always_apply
        self.p = p

    def __call__(self, image):
        image = image[:, :, [1, 2, 0]]  # GBR
        return image

    def __repr__(self):
        return f'{self.__class__.__name__}(always_apply={self.always_apply}, p={self.p})'
    